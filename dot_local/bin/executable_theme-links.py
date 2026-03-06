#!/usr/bin/env python3

from __future__ import annotations

import os
import sys
from pathlib import Path

try:
    import tomllib  # Python 3.11+
except ModuleNotFoundError:
    print("theme-links: Python 3.11+ is required (missing tomllib)", file=sys.stderr)
    sys.exit(1)


CONFIG = Path.home() / ".config" / "theme-links.toml"
VALID_MODES = {"light", "dark"}


def eprint(*args: object) -> None:
    print(*args, file=sys.stderr)


def expand_path(path_str: str) -> Path:
    return Path(path_str).expanduser()


def load_config(config_path: Path) -> list[dict[str, str]]:
    if not config_path.is_file():
        eprint(f"theme-links: missing config: {config_path}")
        sys.exit(1)

    try:
        with config_path.open("rb") as f:
            data = tomllib.load(f)
    except tomllib.TOMLDecodeError as exc:
        eprint(f"theme-links: invalid TOML in {config_path}: {exc}")
        sys.exit(1)

    mappings = data.get("mappings")
    if not isinstance(mappings, list):
        eprint("theme-links: config must contain a [[mappings]] array")
        sys.exit(1)

    validated: list[dict[str, str]] = []
    for i, item in enumerate(mappings, start=1):
        if not isinstance(item, dict):
            eprint(f"theme-links: mappings entry #{i} is not a table")
            sys.exit(1)

        for key in ("link", "light", "dark"):
            value = item.get(key)
            if not isinstance(value, str) or not value.strip():
                eprint(f"theme-links: mappings entry #{i} is missing a valid '{key}'")
                sys.exit(1)

        validated.append({
            "link": item["link"],
            "light": item["light"],
            "dark": item["dark"],
        })

    return validated


def replace_symlink(link: Path, dest: Path, mode: str) -> None:
    if not (dest.exists() or dest.is_symlink()):
        eprint(f"theme-links: missing target {dest}")
        return

    link.parent.mkdir(parents=True, exist_ok=True)

    tmp = link.parent / f".{link.name}.tmp.{os.getpid()}"

    try:
        if tmp.exists() or tmp.is_symlink():
            tmp.unlink()

        tmp.symlink_to(dest)
        tmp.replace(link)
        print(f"theme-links: {mode} → {link} -> {dest}")
    finally:
        if tmp.exists() or tmp.is_symlink():
            try:
                tmp.unlink()
            except OSError:
                pass


def main(argv: list[str]) -> int:
    if len(argv) != 2 or argv[1] not in VALID_MODES:
        eprint(f"Usage: {Path(argv[0]).name} [light|dark]")
        return 1

    mode = argv[1]
    mappings = load_config(CONFIG)

    for mapping in mappings:
        link = expand_path(mapping["link"])
        dest = expand_path(mapping[mode])
        replace_symlink(link, dest, mode)

    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))