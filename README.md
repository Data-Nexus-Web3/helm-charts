# Data Nexus Web3 Helm Charts

Production Helm chart repository for Data Nexus Web3 infrastructure.

## Usage

```bash
helm repo add data-nexus https://data-nexus-web3.github.io/helm-charts
helm repo update
```

Browse available charts:

```bash
helm search repo data-nexus
```

## Adding a New Chart

1. Create your chart under `charts/`:

   ```bash
   helm create charts/my-chart
   ```

2. Open a PR targeting `main`. CI will automatically lint and install-test your chart.

3. Once merged, the release workflow packages the chart and publishes it to GitHub Pages.

## CI/CD

| Workflow | Trigger | What it does |
|----------|---------|--------------|
| **Lint and Test** | PR touching `charts/**` | Runs `ct lint` and `ct install` against a Kind cluster |
| **Release** | Push to `main` touching `charts/**` | Packages charts, creates GitHub Releases, updates `gh-pages` index |

## Repository Structure

```
charts/          # One subdirectory per chart
ct.yaml          # chart-testing configuration
.github/workflows/
  lint-test.yml  # PR validation
  release.yml    # Publish on merge
```

## Setup Note

GitHub Pages must be enabled on the `gh-pages` branch (root) for the chart repository to serve `index.yaml`. The `gh-pages` branch is created automatically by chart-releaser on the first release.
