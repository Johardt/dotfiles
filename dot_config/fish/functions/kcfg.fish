function kcfg --description 'Set KUBECONFIG and keep cursor at end of path'
    set -gx KUBECONFIG ~/.kube/
    commandline --replace "$KUBECONFIG"
end