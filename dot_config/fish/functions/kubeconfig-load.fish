function kubeconfig-load
    set -l configs ~/.kube/*.yml ~/.kube/*.yaml
    set -l kubeconfigs

    for config in $configs
        if test -f "$config"
            set --append kubeconfigs "$config"
        end
    end

    set -gx KUBECONFIG (string join : $kubeconfigs)
    kubectx
end
