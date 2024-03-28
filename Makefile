apply:
	k0sctl apply -c ./k0s/config.yaml

apply-dry-run:
	k0sctl apply --dry-run -c ./k0s/config.yaml

apply-charts:
	helmfile apply -f ./config/helmfile.yaml

apply-charts-dry-run:
	helmfile diff -f ./config/helmfile.yaml

sync-charts:
	helmfile sync -f ./config/helmfile.yaml

add-registry-config:
	ansible-playbook -i playbooks/inventory playbooks/add_containerd_config.yaml

kubeconfig:
	@k0sctl kubeconfig -c ./k0s/config.yaml
