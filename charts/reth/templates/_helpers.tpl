{{- define "reth.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "reth.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "reth.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "reth.labels" -}}
helm.sh/chart: {{ include "reth.chart" . }}
{{ include "reth.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "reth.selectorLabels" -}}
app.kubernetes.io/name: {{ include "reth.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "reth.componentLabelFor" -}}
app.kubernetes.io/component: {{ . }}
{{- end }}

{{- define "reth.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "reth.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "reth.p2pPort" -}}
{{- if .p2pNodePort.enabled }}
{{- print .p2pNodePort.port }}
{{- else }}
{{- printf "30303" -}}
{{- end }}
{{- end -}}

{{- define "reth.replicas" -}}
{{- if .p2pNodePort.enabled }}
{{- print 1 }}
{{- else }}
{{- default 1 .replicaCount }}
{{- end }}
{{- end -}}

{{- define "reth.imageTag" -}}
{{- default .Chart.AppVersion .Values.image.tag }}
{{- end }}

{{- define "reth.httpPort" -}}
{{- index .Values.reth.service.ports "http-rpc" }}
{{- end }}

{{- define "reth.wsPort" -}}
{{- index .Values.reth.service.ports "http-ws" }}
{{- end }}

{{- define "reth.authRpcPort" -}}
{{- index .Values.reth.service.ports "http-authrpc" }}
{{- end }}

{{- define "reth.metricsPort" -}}
{{- index .Values.reth.service.ports "http-metrics" }}
{{- end }}
