# reth

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.11.0](https://img.shields.io/badge/AppVersion-v1.11.0-informational?style=flat-square)

Deploy and scale Reth Ethereum execution client nodes inside Kubernetes

**Homepage:** <https://reth.rs>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| vincepetoscia |  |  |

## Source Code

* <https://github.com/paradigmxyz/reth>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| authRpc | object | `{"addr":"0.0.0.0"}` | Reth Engine API (Auth RPC) configuration Port is configured via reth.service.ports.http-authrpc |
| consensus | object | `{"beaconApi":{"addr":"0.0.0.0","enabled":true,"port":5052},"checkpointSyncUrl":"","client":"lighthouse","enabled":false,"extraArgs":[],"image":{"pullPolicy":"IfNotPresent","repository":"sigp/lighthouse","tag":"latest"},"metrics":{"addr":"0.0.0.0","enabled":true,"port":5054},"p2p":{"port":9000,"quicPort":9001},"service":{"enabled":true,"type":"ClusterIP"}}` | Optional consensus client sidecar configuration (Lighthouse beacon node) |
| consensus.beaconApi | object | `{"addr":"0.0.0.0","enabled":true,"port":5052}` | Beacon API configuration |
| consensus.checkpointSyncUrl | string | `""` | Optional checkpoint sync URL for faster sync bootstrap |
| consensus.extraArgs | list | `[]` | Additional CLI arguments passed to `lighthouse bn` |
| consensus.metrics | object | `{"addr":"0.0.0.0","enabled":true,"port":5054}` | Lighthouse metrics configuration |
| consensus.p2p | object | `{"port":9000,"quicPort":9001}` | Lighthouse P2P listener configuration |
| consensus.service | object | `{"enabled":true,"type":"ClusterIP"}` | Optional service to expose beacon API and/or consensus metrics |
| fullnameOverride | string | `""` |  |
| httpRpc | object | `{"addr":"0.0.0.0","api":["eth","net","web3","txpool"],"enabled":true}` | Reth HTTP RPC configuration |
| httpRpc.api | list | `["eth","net","web3","txpool"]` | JSON-RPC API namespaces to enable |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/paradigmxyz/reth"` | Reth container image |
| image.tag | string | `""` | Overrides the image tag (default: Chart.appVersion) |
| imagePullSecrets | list | `[]` |  |
| metrics | object | `{"addr":"0.0.0.0","enabled":true}` | Reth metrics configuration Port is configured via reth.service.ports.http-metrics |
| nameOverride | string | `""` |  |
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
| reth.affinity | object | `{}` |  |
| reth.affinityPresets.antiAffinityByHostname | bool | `true` |  |
| reth.chain | string | `"mainnet"` | Ethereum network: mainnet, sepolia, holesky |
| reth.extraArgs | list | `[]` | Additional CLI arguments passed to reth node |
| reth.extraLabels | object | `{}` | Extra labels to attach to the Pod |
| reth.fullNode | bool | `false` | Run as full node (pruned) instead of archive |
| reth.initChownData.enabled | bool | `true` |  |
| reth.initChownData.image.pullPolicy | string | `"IfNotPresent"` |  |
| reth.initChownData.image.repository | string | `"busybox"` |  |
| reth.initChownData.image.tag | string | `"1.36.1"` |  |
| reth.jwtSecret | string | `""` | JWT secret for Engine API authentication (hex-encoded, 32 bytes) If empty, a random secret is generated. Share this with your consensus client. |
| reth.livenessProbe | object | `{"enabled":true,"failureThreshold":5,"initialDelaySeconds":30,"periodSeconds":60,"tcpSocket":{"port":"http-rpc"},"timeoutSeconds":5}` | Liveness probe configuration (active after startupProbe succeeds) |
| reth.nodeSelector | object | `{}` |  |
| reth.p2pNodePort.enabled | bool | `false` |  |
| reth.p2pNodePort.initContainer.image.pullPolicy | string | `"IfNotPresent"` |  |
| reth.p2pNodePort.initContainer.image.repository | string | `"bitnami/kubectl"` |  |
| reth.p2pNodePort.initContainer.image.tag | string | `"1.29"` |  |
| reth.p2pNodePort.port | int | `31000` |  |
| reth.podAnnotations | object | `{}` |  |
| reth.podSecurityContext.fsGroup | int | `10001` |  |
| reth.podSecurityContext.runAsGroup | int | `10001` |  |
| reth.podSecurityContext.runAsNonRoot | bool | `true` |  |
| reth.podSecurityContext.runAsUser | int | `10001` |  |
| reth.readinessProbe | object | `{"enabled":true,"failureThreshold":6,"initialDelaySeconds":10,"periodSeconds":10,"tcpSocket":{"port":"http-rpc"},"timeoutSeconds":5}` | Readiness probe configuration (active after startupProbe succeeds) |
| reth.replicaCount | int | `1` | Number of replicas (forced to 1 when p2pNodePort is enabled) |
| reth.resources | object | `{}` |  |
| reth.service.ports.http-authrpc | int | `8551` |  |
| reth.service.ports.http-metrics | int | `9001` |  |
| reth.service.ports.http-rpc | int | `8545` |  |
| reth.service.ports.http-ws | int | `8546` |  |
| reth.service.topologyAwareRouting.enabled | bool | `false` |  |
| reth.service.type | string | `"ClusterIP"` |  |
| reth.snapshotRestore | object | `{"checksumSha256":"","checksumsSha256":"","compression":"auto","enabled":false,"extraEnv":[],"image":{"pullPolicy":"IfNotPresent","repository":"ghcr.io/nodeify-eth/stream-download","tag":"latest"},"maxRetries":10,"rmSubpath":"true","stallMinutes":3,"subpath":"","tarArgs":"","url":"","urls":""}` | Snapshot restore via streaming download (runs as init container) Uses https://github.com/nodeify-eth/stream-download |
| reth.startupProbe | object | `{"enabled":true,"failureThreshold":2880,"periodSeconds":30,"tcpSocket":{"port":"http-rpc"},"timeoutSeconds":5}` | Startup probe configuration Protects slow-starting nodes during initial sync. Default window: failureThreshold(2880) x periodSeconds(30s) = 24 hours. |
| reth.terminationGracePeriodSeconds | int | `120` | Seconds to wait before force-killing the container |
| reth.tolerations | list | `[]` |  |
| reth.volumeClaimSpec | object | `{"accessModes":["ReadWriteOnce"],"resources":{"requests":{"storage":"2Ti"}},"storageClassName":null}` | PersistentVolumeClaimSpec for chain data |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| wsRpc | object | `{"addr":"0.0.0.0","api":["eth","net","web3"],"enabled":false}` | Reth WebSocket RPC configuration |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
