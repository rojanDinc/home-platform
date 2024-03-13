# Home platform

This repository houses configurations for managing my home platform using Kubernetes, Ansible, and Helmfile. This repository aims to streamline my deployment and configuration processes for my platform.

## Contents
**k0s Configurations**: Contains configurations for k0s, a lightweight Kubernetes distribution. These configurations help in setting up and managing your Kubernetes clusters with ease.

**Ansible Playbooks**: Includes Ansible playbooks for automating various server tasks such as restarting k0s on each node.

**Helmfile Configurations**: Holds configurations for managing Helm charts using Helmfile. Helmfile simplifies the management of Helm charts by providing a declarative way to define, install, and upgrade multiple charts as part of your application stack.

## Getting Started
To get started with setting up the platform, follow these steps:

**Clone the Repository**: Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/rojanDinc/home-platform.git
```

**Set Up k0s**: Review the k0s configurations provided in the k0s-config directory. Customize the configurations as per your requirements such as your node IPs and SSH keys to deploy your Kubernetes cluster using k0s.
To apply the configurations, run the following command:

```bash
make apply
```

after which, your Kubernetes cluster should be ready to use.

Run the following command to get a kubeconfig and save it to a file:

```bash
make kubeconfig > config.yaml
```
place the `config.yaml` file in your `.kube` directory.

**Add containerd config for nodes**:
For the kubelet to be able to pull image from our private registry, we need to add containerd mirror config to each node. Make sure that you've configured the ansible [inventory](https://github.com/rojanDinc/home-platform/blob/main/playbooks/inventory) with the correct node IPs. Run the following command:

```bash
make add-registry-config
```

this command will add containerd config to each node using an ansible playbook.

**Deploy charts**:
Now the last step is to deploy the charts. Run the following command:

```bash
make apply-charts
```
