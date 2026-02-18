# avalanche

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.14.1](https://img.shields.io/badge/AppVersion-v1.14.1-informational?style=flat-square)

Deploy and scale AvalancheGo RPC nodes inside Kubernetes

**Homepage:** <https://www.avax.network>

## Source Code

* <https://github.com/ava-labs/avalanchego>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| avalanche.affinity | object | `{}` |  |
| avalanche.affinityPresets.antiAffinityByHostname | bool | `true` |  |
| avalanche.extraArgs | list | `[]` | Additional CLI arguments passed to avalanchego |
| avalanche.extraLabels | object | `{}` | Extra labels to attach to the Pod |
| avalanche.initChownData.enabled | bool | `true` |  |
| avalanche.initChownData.image.pullPolicy | string | `"IfNotPresent"` |  |
| avalanche.initChownData.image.repository | string | `"busybox"` |  |
| avalanche.initChownData.image.tag | string | `"1.36.1"` |  |
| avalanche.livenessProbe | object | `{"enabled":true,"failureThreshold":5,"httpGet":{"path":"/ext/health","port":"http-rpc"},"initialDelaySeconds":30,"periodSeconds":60,"timeoutSeconds":5}` | Liveness probe configuration Only active after startupProbe succeeds. |
| avalanche.networkId | string | `"mainnet"` | Network to connect to: mainnet, fuji, testnet, local, or network-<id> |
| avalanche.nodeSelector | object | `{}` |  |
| avalanche.p2pNodePort.enabled | bool | `false` |  |
| avalanche.p2pNodePort.initContainer.image.pullPolicy | string | `"IfNotPresent"` |  |
| avalanche.p2pNodePort.initContainer.image.repository | string | `"bitnami/kubectl"` |  |
| avalanche.p2pNodePort.initContainer.image.tag | string | `"1.29"` |  |
| avalanche.p2pNodePort.port | int | `31000` |  |
| avalanche.podAnnotations | object | `{}` |  |
| avalanche.podSecurityContext.fsGroup | int | `0` |  |
| avalanche.podSecurityContext.runAsGroup | int | `0` |  |
| avalanche.podSecurityContext.runAsNonRoot | bool | `false` |  |
| avalanche.podSecurityContext.runAsUser | int | `0` |  |
| avalanche.readinessProbe | object | `{"enabled":true,"failureThreshold":6,"httpGet":{"path":"/ext/health","port":"http-rpc"},"initialDelaySeconds":10,"periodSeconds":10,"timeoutSeconds":5}` | Readiness probe configuration Only active after startupProbe succeeds. |
| avalanche.replicaCount | int | `1` | Number of replicas (forced to 1 when p2pNodePort is enabled) |
| avalanche.resources | object | `{}` |  |
| avalanche.service.ports.http-rpc | int | `9650` |  |
| avalanche.service.ports.http-staking | int | `9651` |  |
| avalanche.service.topologyAwareRouting.enabled | bool | `false` |  |
| avalanche.service.type | string | `"ClusterIP"` |  |
| avalanche.snapshotRestore | object | `{"checksumSha256":"","checksumsSha256":"","compression":"auto","enabled":false,"extraEnv":[],"image":{"pullPolicy":"IfNotPresent","repository":"ghcr.io/nodeify-eth/stream-download","tag":"latest"},"maxRetries":10,"rmSubpath":"true","stallMinutes":3,"subpath":"","tarArgs":"","url":"","urls":""}` | Snapshot restore via streaming download (runs as init container) Uses https://github.com/nodeify-eth/stream-download Idempotent: writes a stamp file and skips on subsequent restarts. |
| avalanche.snapshotRestore.checksumSha256 | string | `""` | Optional SHA-256 checksum of the snapshot archive |
| avalanche.snapshotRestore.checksumsSha256 | string | `""` | Comma-delimited SHA-256 checksums (positional match with urls) |
| avalanche.snapshotRestore.compression | string | `"auto"` | Compression format: auto, none, gzip, bzip2, xz, zstd, lz4 |
| avalanche.snapshotRestore.extraEnv | list | `[]` | Extra environment variables to pass to the init container |
| avalanche.snapshotRestore.maxRetries | int | `10` | Max retry attempts |
| avalanche.snapshotRestore.rmSubpath | string | `"true"` | Remove subpath directory before extraction |
| avalanche.snapshotRestore.stallMinutes | int | `3` | Minutes of no progress before watchdog kills curl |
| avalanche.snapshotRestore.subpath | string | `""` | Subdirectory within the data volume to extract into |
| avalanche.snapshotRestore.tarArgs | string | `""` | Extra tar arguments (e.g. "--strip-components=1") |
| avalanche.snapshotRestore.url | string | `""` | Snapshot URL (required when enabled). Supports .tar, .tar.gz, .tar.zst, .tar.lz4 |
| avalanche.snapshotRestore.urls | string | `""` | Comma-delimited list of URLs (takes precedence over url) |
| avalanche.startupProbe | object | `{"enabled":true,"failureThreshold":2880,"periodSeconds":30,"tcpSocket":{"port":"http-rpc"},"timeoutSeconds":5}` | Startup probe configuration Protects slow-starting nodes during initial sync/bootstrap. Default window: failureThreshold(2880) × periodSeconds(30s) = 24 hours. Liveness and readiness probes are suppressed until startup succeeds. |
| avalanche.terminationGracePeriodSeconds | int | `120` | Seconds to wait before force-killing the container |
| avalanche.tolerations | list | `[]` |  |
| avalanche.volumeClaimSpec | object | `{"accessModes":["ReadWriteOnce"],"resources":{"requests":{"storage":"2Ti"}},"storageClassName":null}` | PersistentVolumeClaimSpec for chain data |
| cChainConfig | object | See values below | C-Chain specific configuration (JSON format, mounted as C/config.json) |
| extraChainConfigs | object | `{}` | Extra chain configs keyed by chain alias or ID Each entry is mounted as <key>/config.json under the chain config directory |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"avaplatform/avalanchego"` | AvalancheGo container image |
| image.tag | string | `""` | Overrides the image tag (default: Chart.appVersion) |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeConfig | object | See values below | AvalancheGo node configuration (JSON format, mounted as config.json) See https://build.avax.network/docs/nodes/configure/configs-flags NOTE: http-port and staking-port are injected automatically from avalanche.service.ports to prevent drift. Do not set them here. |
| prometheus.serviceMonitor.enabled | bool | `false` |  |
| prometheus.serviceMonitor.interval | string | `"30s"` |  |
| prometheus.serviceMonitor.labels | object | `{}` |  |
| prometheus.serviceMonitor.scrapeTimeout | string | `"10s"` |  |
| rbac.clusterRules[0].apiGroups[0] | string | `""` |  |
| rbac.clusterRules[0].resources[0] | string | `"nodes"` |  |
| rbac.clusterRules[0].verbs[0] | string | `"get"` |  |
| rbac.clusterRules[0].verbs[1] | string | `"list"` |  |
| rbac.clusterRules[0].verbs[2] | string | `"watch"` |  |
| rbac.create | bool | `true` |  |
| rbac.rules[0].apiGroups[0] | string | `""` |  |
| rbac.rules[0].resources[0] | string | `"services"` |  |
| rbac.rules[0].verbs[0] | string | `"get"` |  |
| rbac.rules[0].verbs[1] | string | `"list"` |  |
| rbac.rules[0].verbs[2] | string | `"watch"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
