local M = {}

-- Function to detect if system is in dark mode
function M.is_dark_mode()
  -- First try TERM_BACKGROUND environment variable
  local term_bg = vim.fn.getenv("TERM_BACKGROUND")
  if term_bg == "light" then
    return false
  elseif term_bg == "dark" then
    return true
  end

  -- Fallback: check macOS system appearance
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    -- If AppleInterfaceStyle is "Dark", system is in dark mode
    -- If the command fails or returns empty, system is in light mode
    return result:match("Dark") ~= nil
  end

  -- Default to light mode if detection fails
  return false
end

-- Setup function to configure theme and background
function M.setup()
  -- Cache the dark mode detection result
  local dark_mode = M.is_dark_mode()
  
  -- Set background immediately
  vim.o.background = dark_mode and "dark" or "light"
  
  -- Set colorscheme immediately
  vim.cmd.colorscheme(dark_mode and "xcodedark" or "xcodelight")
end

return M
