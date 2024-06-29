# Kubernetes

## Baremetal Installation

Before installing k3s, be aware that any docker installation within the same server may be impacted by k3s overriding TLS termination with a default Traefik cert from the internal Traefik component of Kubernetes.  To avoid this, you can run the install script with the option `INSTALL_K3S_EXEC="--disable traefik"`. If it's too much trouble during setup/before full migration, simply uninstall k3s (although this should affect Kubernetes persistent volumes, backup your data just in case).

Taking into consideration a Fedora installation, these are the steps and requirements (for k3s):

1. Run the installation script:
```bash
# To install without Traefik messing with local pre-existing certificate handling
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable traefik" sh -

# To install without any particular conditions
curl -sfL https://get.k3s.io | sh -
```

2. Set KUBECONFIG environment variable:
```bash
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
# To make it persistent, add it to your .bashrc:
echo 'export KUBECONFIG=/etc/rancher/k3s/k3s.yaml' >> ~/.bashrc
source ~/.bashrc

sudo chmod 644 /etc/rancher/k3s/k3s.yaml # To allow user to use kubectl without sudo
```
Note: You can run kubectl with sudo by appending `k3s` to any kubectl command. Run `sudo k3s` for usage examples.

3. Open the necessary ports:
```bash
# If using firewalld, make sure that ports 6443 and 10250 are open for Kubernetes.
sudo firewall-cmd --zone=public --add-port=6443/tcp --permanent
sudo firewall-cmd --zone=public --add-port=10250/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --zone=public --list-ports
```

4. Verify installation:
```bash
sudo systemctl status k3s
kubectl get nodes
```

5. Install helm:
```bash
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
```

6. Add rancher helm chart repo:
```bash
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo update
```

7.
`sudo k3s kubectl create namespace cattle-system`


Note: You can easily uninstall k3s with `/usr/local/bin/k3s-uninstall.sh`. Be aware that this will uninstall all k3s-related components, which includes pods, services, and configurations. By doing so, you assume any risks.

#. Install Flannel:
```
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

## Troubleshooting

If there are errors on the Master Node Initializing step, try checking logs with: `sudo journalctl -u kubelet -f` and then restart kubelet:

## Kompose

The Kompose tool is useful to convert Docker compose files to a Kubernetes-ready set of config files. It does enough of a good job to ease the transition from Docker to Kubernetes.



sudo systemctl stop kubelet
sudo systemctl start kubelet
strace -eopenat kubectl version
