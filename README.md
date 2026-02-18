# Data Nexus Web3 Helm Charts

Production Helm chart repository for Data Nexus Web3 infrastructure.

## Available Charts

| Chart | Description | Current App Version |
|---|---|---|
| `avalanche` | AvalancheGo RPC node (StatefulSet, PVC, optional snapshot restore, optional P2P NodePort, optional ServiceMonitor) | `v1.14.1` |
| `reth` | Reth execution client (StatefulSet, PVC, JWT secret management, optional Lighthouse sidecar, optional snapshot restore, optional ServiceMonitor) | `v1.11.0` |

## Usage

```bash
helm repo add data-nexus https://data-nexus-web3.github.io/helm-charts
helm repo update
helm search repo data-nexus
```

## Quick Start

### Avalanche

Install AvalancheGo RPC node:

```bash
helm install avalanche charts/avalanche
```

Install with snapshot restore:

```bash
helm install avalanche charts/avalanche \
  --set avalanche.snapshotRestore.enabled=true \
  --set avalanche.snapshotRestore.url="https://example.com/avalanche-snapshot.tar.zst"
```

### Reth

Install Reth execution client (requires an external consensus client unless sidecar is enabled):

```bash
helm install reth charts/reth
```

Install Reth with in-pod Lighthouse consensus sidecar:

```bash
helm install reth charts/reth \
  --set consensus.enabled=true
```

Install Reth with snapshot restore:

```bash
helm install reth charts/reth \
  --set reth.snapshotRestore.enabled=true \
  --set reth.snapshotRestore.url="https://example.com/reth-snapshot.tar.zst"
```

## Local Validation

Run chart linting:

```bash
helm lint charts/avalanche
helm lint charts/reth
```

Render manifests for inspection:

```bash
helm template avalanche charts/avalanche
helm template reth charts/reth
```

## Adding a New Chart

1. Create your chart under `charts/`.
2. Open a PR targeting `main` (CI runs `ct lint` + `ct install` automatically).
3. Merge to `main` to trigger packaging and release publication.

## CI/CD

| Workflow | Trigger | What it does |
|---|---|---|
| **Lint and Test** | PR touching `charts/**` | Runs `ct lint` and `ct install` against a Kind cluster |
| **Release** | Push to `main` touching `charts/**` | Packages charts, creates GitHub Releases, updates `gh-pages` index |

## Repository Structure

```text
charts/          # One subdirectory per chart
ct.yaml          # chart-testing configuration
.github/workflows/
  lint-test.yml  # PR validation
  release.yml    # Publish on merge
```

## Setup Note

GitHub Pages must be enabled on the `gh-pages` branch (root) for the chart repository to serve `index.yaml`. The `gh-pages` branch is created automatically by chart-releaser on the first release.
