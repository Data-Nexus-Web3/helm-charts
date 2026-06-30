# firehose-ethereum

![Version: 1.7.1](https://img.shields.io/badge/Version-1.7.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: geth-v1.16.9-fh3.0](https://img.shields.io/badge/AppVersion-geth--v1.16.9--fh3.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| chunkMode.chunkConfig.startBlock | int | `0` | Starting block number (inclusive) |
| chunkMode.chunkConfig.stopBlock | int | `100000` | Ending block number (exclusive) |
| chunkMode.chunkConfig.workers | int | `4` | Number of workers to split block range across |
| chunkMode.components.merger.config | object | `{"merger-delete-threads":100,"merger-time-between-store-lookups":"10s"}` | Merger node configuration |
| chunkMode.components.merger.enabled | bool | `true` | Enable the Firehose merger node |
| chunkMode.components.reader.config | object | `{"reader-node-blocks-chan-capacity":5000,"reader-node-firehose-plaintext":true,"reader-node-readiness-max-latency":"1200s"}` | Reader node configuration |
| chunkMode.components.reader.enabled | bool | `true` | Enable the Firehose reader node |
| chunkMode.components.remoteFirehose.endpoint | string | `"https://firehose.example.com/ethereum"` | Firehose endpoint to fetch processed block data |
| chunkMode.components.remoteFirehose.extraEnvs | list | `[]` | Extra environment variables for remoteFirehose component |
| chunkMode.components.rpcPoller.affinity | object | `{}` | Affinity rules for rpc poller pod scheduling |
| chunkMode.components.rpcPoller.endpoint | string | `"https://YOUR_ETHEREUM_ENDPOINT"` | RPC endpoint to poll for blocks |
| chunkMode.components.rpcPoller.extraEnvs | list | `[]` | Extra environment variables for rpcPoller component |
| chunkMode.components.rpcPoller.podAnnotations | object | `{}` | Annotations to add to rpc poller pods |
| chunkMode.components.rpcPoller.resources | object | `{}` | Resource requests and limits for rpc poller |
| chunkMode.method | string | `"firehose"` | Mode to use in chunk processing Options:   - "firehose": Remote firehose for block data   - "poller": Remote rpc for block data |
| chunkMode.storage | object | `{"readerNode":{"size":"50Mi"},"storageClass":""}` | Storage configuration for chunk mode |
| commonConfig.common-auto-mem-limit-percent | int | `90` |  |
| commonConfig.common-forked-blocks-store-url | string | `""` |  |
| commonConfig.common-index-block-sizes | int | `10000` |  |
| commonConfig.common-live-blocks-addr | string | `""` |  |
| commonConfig.common-merged-blocks-store-url | string | `""` |  |
| commonConfig.common-one-block-store-url | string | `""` |  |
| commonConfig.common-system-shutdown-signal-delay | string | `"10s"` |  |
| fullMode.components.baseConsensus.config.chain | int | `8453` | L2 chain id (8453 = Base mainnet) |
| fullMode.components.baseConsensus.config.l1Beacon | string | `"https://YOUR_BEACON_ENDPOINT"` | Ethereum L1 beacon chain endpoint |
| fullMode.components.baseConsensus.config.l1EthRpc | string | `"http://YOUR_ETHEREUM_ENDPOINT"` | Ethereum L1 execution RPC endpoint |
| fullMode.components.baseConsensus.config.l1TrustRpc | bool | `true` | Trust the L1 RPC without verification |
| fullMode.components.baseConsensus.config.l2TrustRpc | bool | `true` | Trust the L2 RPC without verification |
| fullMode.components.baseConsensus.config.p2pBootnodes | string | `"enr:-J24QNz9lbrKbN4iSmmjtnr7SjUMk4zB7f1krHZcTZx-JRKZd0kA2gjufUROD6T3sOWDVDnFJRvqBBo62zuF-hYCohOGAYiOoEyEgmlkgnY0gmlwhAPniryHb3BzdGFja4OFQgCJc2VjcDI1NmsxoQKNVFlCxh_B-716tTs-h1vMzZkSs1FTu_OYTNjgufplG4N0Y3CCJAaDdWRwgiQG,enr:-J24QH-f1wt99sfpHy4c0QJM-NfmsIfmlLAMMcgZCUEgKG_BBYFc6FwYgaMJMQN5dsRBJApIok0jFn-9CS842lGpLmqGAYiOoDRAgmlkgnY0gmlwhLhIgb2Hb3BzdGFja4OFQgCJc2VjcDI1NmsxoQJ9FTIv8B9myn1MWaC_2lJ-sMoeCDkusCsk4BYHjjCq04N0Y3CCJAaDdWRwgiQG,enr:-J24QDXyyxvQYsd0yfsN0cRr1lZ1N11zGTplMNlW4xNEc7LkPXh0NAJ9iSOVdRO95GPYAIc6xmyoCCG6_0JxdL3a0zaGAYiOoAjFgmlkgnY0gmlwhAPckbGHb3BzdGFja4OFQgCJc2VjcDI1NmsxoQJwoS7tzwxqXSyFL7g0JM-KWVbgvjfB8JA__T7yY_cYboN0Y3CCJAaDdWRwgiQG,enr:-J24QHmGyBwUZXIcsGYMaUqGGSl4CFdx9Tozu-vQCn5bHIQbR7On7dZbU61vYvfrJr30t0iahSqhc64J46MnUO2JvQaGAYiOoCKKgmlkgnY0gmlwhAPnCzSHb3BzdGFja4OFQgCJc2VjcDI1NmsxoQINc4fSijfbNIiGhcgvwjsjxVFJHUstK9L1T8OTKUjgloN0Y3CCJAaDdWRwgiQG,enr:-J24QG3ypT4xSu0gjb5PABCmVxZqBjVw9ca7pvsI8jl4KATYAnxBmfkaIuEqy9sKvDHKuNCsy57WwK9wTt2aQgcaDDyGAYiOoGAXgmlkgnY0gmlwhDbGmZaHb3BzdGFja4OFQgCJc2VjcDI1NmsxoQIeAK_--tcLEiu7HvoUlbV52MspE0uCocsx1f_rYvRenIN0Y3CCJAaDdWRwgiQG"` | Comma-separated enr bootnode list (defaults to Base mainnet bootnodes) |
| fullMode.components.baseConsensus.config.p2pPrivPath | string | `"/data/base_consensus_p2p_priv.txt"` | p2p private key path (under the /data mount) |
| fullMode.components.baseConsensus.config.safedbPath | string | `"/data/safedb"` | safedb path (under the /data mount) |
| fullMode.components.baseConsensus.enabled | bool | `false` | Enable the Base consensus client as a reader sidecar |
| fullMode.components.baseConsensus.extraArgs | list | `[]` | Additional arguments to pass to base-consensus |
| fullMode.components.baseConsensus.image | object | `{"pullPolicy":"IfNotPresent","repository":"ghcr.io/base/node-reth","tag":"v1.0.0"}` | Image configuration for base-consensus |
| fullMode.components.baseConsensus.resources | object | `{"limits":{"memory":"4Gi"},"requests":{"cpu":"100m","memory":"512Mi"}}` | Resource requests and limits for base-consensus |
| fullMode.components.grpc.affinity | object | `{}` | Affinity rules for grpc server pod scheduling |
| fullMode.components.grpc.config.advertise-chain-name | string | `"mainnet"` | gRPC server arguments |
| fullMode.components.grpc.config.firehose-rate-limit-bucket-fill-rate | string | `"2s"` |  |
| fullMode.components.grpc.config.firehose-rate-limit-bucket-size | int | `10` |  |
| fullMode.components.grpc.enabled | bool | `true` | Enable the Firehose gRPC server |
| fullMode.components.grpc.extraEnvs | list | `[]` | Extra environment variables for grpc component |
| fullMode.components.grpc.ingress | object | `{"annotations":[],"enabled":false,"host":"firehose.example.com","ingressClassName":""}` | gRPC server configuration |
| fullMode.components.grpc.nodeSelector | object | `{}` | Node selector for grpc server pod scheduling |
| fullMode.components.grpc.podAnnotations | object | `{}` | Annotations to add to grpc server pods |
| fullMode.components.grpc.replicas | int | `1` | Number of replicas for the gRPC server |
| fullMode.components.grpc.resources | object | `{}` | Resource requests and limits for grpc server |
| fullMode.components.grpc.tolerations | list | `[]` | Tolerations for grpc server pod scheduling |
| fullMode.components.indexer.affinity | object | `{}` | Affinity rules for indexer node pod scheduling |
| fullMode.components.indexer.config.log-to-file | bool | `false` | Indexer arguments |
| fullMode.components.indexer.enabled | bool | `true` | Enable the Firehose indexer node |
| fullMode.components.indexer.extraEnvs | list | `[]` | Extra environment variables for indexer component |
| fullMode.components.indexer.nodeSelector | object | `{}` | Node selector for indexer node pod scheduling |
| fullMode.components.indexer.podAnnotations | object | `{}` | Annotations to add to indexer node pods |
| fullMode.components.indexer.replicas | int | `1` | Number of replicas for the indexer node |
| fullMode.components.indexer.resources | object | `{}` | Resource requests and limits for indexer node |
| fullMode.components.indexer.tolerations | list | `[]` | Tolerations for indexer node pod scheduling |
| fullMode.components.lighthouse.affinity | object | `{}` | Affinity rules for lighthouse beacon node pod scheduling |
| fullMode.components.lighthouse.config.checkpointSyncUrl | string | `"https://sync-mainnet.beaconcha.in"` | Checkpoint sync URL for faster initial sync |
| fullMode.components.lighthouse.config.network | string | `"mainnet"` | Ethereum network (mainnet, sepolia, holesky) |
| fullMode.components.lighthouse.config.pruneBlobs | bool | `true` | Remove old blob data to save space (recommended for non-archive nodes) |
| fullMode.components.lighthouse.enabled | bool | `true` | Enable Lighthouse for beacon chain synchronization |
| fullMode.components.lighthouse.extraArgs | list | `[]` | Additional arguments to pass to lighthouse beacon_node |
| fullMode.components.lighthouse.image | object | `{"pullPolicy":"IfNotPresent","repository":"sigp/lighthouse","tag":"v8.1.3"}` | Image configuration for Lighthouse |
| fullMode.components.lighthouse.nodeSelector | object | `{}` | Node selector for lighthouse beacon node pod scheduling |
| fullMode.components.lighthouse.podAnnotations | object | `{}` | Annotations to add to lighthouse beacon node pods |
| fullMode.components.lighthouse.replicas | int | `1` | Number of replicas for the Lighthouse beacon node |
| fullMode.components.lighthouse.resources | object | `{}` | Resource requests and limits for lighthouse beacon node |
| fullMode.components.lighthouse.tolerations | list | `[]` | Tolerations for lighthouse beacon node pod scheduling |
| fullMode.components.merger.affinity | object | `{}` | Affinity rules for merger node pod scheduling |
| fullMode.components.merger.config.merger-delete-threads | int | `100` |  |
| fullMode.components.merger.config.merger-time-between-store-lookups | string | `"10s"` | Merger node arguments |
| fullMode.components.merger.enabled | bool | `true` | Enable the Firehose merger node |
| fullMode.components.merger.extraEnvs | list | `[]` | Extra environment variables for merger component |
| fullMode.components.merger.nodeSelector | object | `{}` | Node selector for merger node pod scheduling |
| fullMode.components.merger.podAnnotations | object | `{}` | Annotations to add to merger node pods |
| fullMode.components.merger.replicas | int | `1` | Number of replicas for the merger node |
| fullMode.components.merger.resources | object | `{}` | Resource requests and limits for merger node |
| fullMode.components.merger.tolerations | list | `[]` | Tolerations for merger node pod scheduling |
| fullMode.components.opNode.affinity | object | `{}` | Affinity rules for op-node pod scheduling |
| fullMode.components.opNode.config.l1 | string | `"https://mainnet.infura.io/v3/YOUR_INFURA_PROJECT_ID"` | Ethereum L1 RPC endpoint |
| fullMode.components.opNode.config.l1Beacon | string | `"https://sync-mainnet.beaconcha.in"` | Ethereum L1 beacon chain endpoint |
| fullMode.components.opNode.config.l1BeaconArchiver | string | `"https://sync-mainnet.beaconcha.in"` | Ethereum L1 beacon chain archiver endpoint |
| fullMode.components.opNode.config.l1RpcKind | string | `"standard"` | L1 RPC kind (standard, erigon, etc.) |
| fullMode.components.opNode.config.l1TrustRpc | bool | `true` | Trust L1 RPC without verification |
| fullMode.components.opNode.config.network | string | `"op-mainnet"` | Optimism network to sync (op-mainnet, base-mainnet, etc.) |
| fullMode.components.opNode.enabled | bool | `false` | Enable OP Node for Optimism L2 execution layer synchronization |
| fullMode.components.opNode.extraArgs | list | `[]` | Additional arguments to pass to op-node |
| fullMode.components.opNode.image | object | `{"pullPolicy":"IfNotPresent","repository":"ghcr.io/streamingfast/go-ethereum","tag":"optimism-v1.101603.1"}` | Image configuration for OP Node |
| fullMode.components.opNode.nodeSelector | object | `{}` | Node selector for op-node pod scheduling |
| fullMode.components.opNode.podAnnotations | object | `{}` | Annotations to add to op-node pods |
| fullMode.components.opNode.replicas | int | `1` | Number of replicas for the OP Node |
| fullMode.components.opNode.resources | object | `{}` | Resource requests and limits for op-node |
| fullMode.components.reader.affinity | object | `{}` | Affinity rules for reader node pod scheduling |
| fullMode.components.reader.config.reader-node-arguments | string | `"--networkid=1 --ipcpath={data-dir}/reader/ipc --port=30302 --http --http.api=eth,net,web3 --http.port=8545 --http.addr=0.0.0.0 --http.vhosts=* --authrpc.port=8551 --authrpc.addr=0.0.0.0 --authrpc.vhosts=* --authrpc.jwtsecret=/jwt/jwt.hex --cache=8192 --syncmode=full --vmtrace=firehose"` |  |
| fullMode.components.reader.config.reader-node-blocks-chan-capacity | int | `5000` |  |
| fullMode.components.reader.config.reader-node-firehose-plaintext | bool | `true` |  |
| fullMode.components.reader.config.reader-node-path | string | `"/app/geth"` | Execution binary path |
| fullMode.components.reader.config.reader-node-readiness-max-latency | string | `"1200s"` |  |
| fullMode.components.reader.enabled | bool | `true` | Enable the Firehose reader node |
| fullMode.components.reader.extraEnvs | list | `[]` | Extra environment variables for reader component |
| fullMode.components.reader.nodeSelector | object | `{}` | Node selector for reader node pod scheduling |
| fullMode.components.reader.podAnnotations | object | `{}` | Annotations to add to reader node pods |
| fullMode.components.reader.replicas | int | `1` | Number of replicas for the reader node |
| fullMode.components.reader.resources | object | `{}` | Resource requests and limits for reader node |
| fullMode.components.reader.tolerations | list | `[]` | Tolerations for reader node pod scheduling |
| fullMode.components.relayer.affinity | object | `{}` | Affinity rules for relayer node pod scheduling |
| fullMode.components.relayer.config.relayer-max-source-latency | string | `"1h"` | Relayer node arguments |
| fullMode.components.relayer.enabled | bool | `true` | Enable the Firehose relayer node |
| fullMode.components.relayer.extraEnvs | list | `[]` | Extra environment variables for relayer component |
| fullMode.components.relayer.nodeSelector | object | `{}` | Node selector for relayer node pod scheduling |
| fullMode.components.relayer.podAnnotations | object | `{}` | Annotations to add to relayer node pods |
| fullMode.components.relayer.replicas | int | `1` | Number of replicas for the relayer node |
| fullMode.components.relayer.resources | object | `{}` | Resource requests and limits for relayer node |
| fullMode.components.relayer.tolerations | list | `[]` | Tolerations for relayer node pod scheduling |
| fullMode.components.substreams.affinity | object | `{}` | Affinity rules for substreams tier 1 pod scheduling |
| fullMode.components.substreams.config.advertise-chain-name | string | `"mainnet"` | Substreams arguments |
| fullMode.components.substreams.config.substreams-block-execution-timeout | string | `"10m"` |  |
| fullMode.components.substreams.config.substreams-rpc-endpoints | string | `""` |  |
| fullMode.components.substreams.config.substreams-state-store-default-tag | string | `"s3"` |  |
| fullMode.components.substreams.config.substreams-state-store-url | string | `""` |  |
| fullMode.components.substreams.config.substreams-tier1-active-requests-hard-limit | int | `50` |  |
| fullMode.components.substreams.config.substreams-tier1-active-requests-soft-limit | int | `45` |  |
| fullMode.components.substreams.config.substreams-tier1-quicksave-store | string | `""` |  |
| fullMode.components.substreams.config.substreams-tier1-subrequests-endpoint | string | `""` |  |
| fullMode.components.substreams.enabled | bool | `false` | Enable Substreams Tier 1 |
| fullMode.components.substreams.extraConfigMaps | list | `[]` | Extra ConfigMaps to mount as volumes Each entry can either reference an existing configmap (name only) or create a new one with data (name + data + mountPath) |
| fullMode.components.substreams.extraEnvs | list | `[]` | Extra environment variables for substreams component |
| fullMode.components.substreams.ingress | object | `{"annotations":[],"enabled":false,"host":"substreams.example.com","ingressClassName":"nginx"}` | gRPC server configuration |
| fullMode.components.substreams.nodeSelector | object | `{}` | Node selector for substreams tier 1 pod scheduling |
| fullMode.components.substreams.podAnnotations | object | `{}` | Annotations to add to substreams tier 1 pods |
| fullMode.components.substreams.replicas | int | `1` | Number of replicas for the Substreams component |
| fullMode.components.substreams.resources | object | `{}` | Resource requests and limits for substreams tier 1 |
| fullMode.components.substreams.tolerations | list | `[]` | Tolerations for substreams tier 1 pod scheduling |
| fullMode.storage | object | `{"lighthouse":{"size":"400Gi"},"readerNode":{"size":"4Ti"},"storageClass":""}` | Storage configuration for full mode |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/streamingfast/go-ethereum"` | Image for Firehose |
| image.tag | string | Chart.appVersion | Overrides the image tag |
| imagePullSecrets | list | `[]` | Pull secrets required to fetch the Image |
| mode | string | `"full"` | Firehose operating mode Options:   - "full": Complete Firehose stack with all components (reader, merger, relayer, etc.)   - "chunk": Lightweight mode for specific block ranges |
| nameOverride | string | `""` |  |
| s3CredentialsSecret | list | `[]` | Secret name containing S3/object storage credentials. Must contain keys: access-key, secret-key |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.labels | object | `{}` | Additional labels to add to the service account |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
