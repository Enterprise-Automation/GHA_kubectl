### Github Action for deploying Kubernetes resources.

# usage:
```
name: CI

on: [push, pull_request]

jobs:
  test-action:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run Kubectl
        uses: Enterprise-Automation/GHA_kubectl@master
        with:
          kubectl: 1.18.2
          kubeconfig: ${{ secrets.kubeconfig }}
          command: |
            echo "Get pods"
            kubectl get pods --all-namespaces
```