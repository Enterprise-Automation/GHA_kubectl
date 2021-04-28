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
          command: |
            echo "Run conftest"
            kustomize build test/kustomize | conftest test -p test/policy -
            echo "Run kubeval"
            helmv3 template ./charts/test | kubeval --strict
```