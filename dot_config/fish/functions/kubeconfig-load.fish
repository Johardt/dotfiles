function kubeconfig-load
    set -l configs ~/.kube/*.yml ~/.kube/*.yaml
    set -e KUBECONFIG

    for config in $configs
        if test -f "$config"
            set --append KUBECONFIG "$config"
        end
    end

    set -gx KUBECONFIG (string join : $KUBECONFIG)
    kubectx
end
