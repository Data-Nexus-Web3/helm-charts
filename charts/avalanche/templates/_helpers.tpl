{{/*
Expand the name of the chart.
*/}}
{{- define "avalanche.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "avalanche.fullname" -}}
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

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "avalanche.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "avalanche.labels" -}}
helm.sh/chart: {{ include "avalanche.chart" . }}
{{ include "avalanche.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "avalanche.selectorLabels" -}}
app.kubernetes.io/name: {{ include "avalanche.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Component label
*/}}
{{- define "avalanche.componentLabelFor" -}}
app.kubernetes.io/component: {{ . }}
{{- end }}

{{/*
Service account name
*/}}
{{- define "avalanche.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "avalanche.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
P2P port — uses NodePort value when enabled, otherwise the staking port
*/}}
{{- define "avalanche.p2pPort" -}}
{{- if .p2pNodePort.enabled }}
{{- print .p2pNodePort.port }}
{{- else }}
{{- index .service.ports "http-staking" -}}
{{- end }}
{{- end -}}

{{/*
Replica count — forced to 1 when P2P NodePort is enabled
*/}}
{{- define "avalanche.replicas" -}}
{{- if .p2pNodePort.enabled }}
{{- print 1 }}
{{- else }}
{{- default 1 .replicaCount }}
{{- end }}
{{- end -}}

{{/*
Image tag — defaults to Chart.appVersion
*/}}
{{- define "avalanche.imageTag" -}}
{{- default .Chart.AppVersion .Values.image.tag }}
{{- end }}

{{/*
HTTP RPC port — single source of truth from service.ports
*/}}
{{- define "avalanche.httpPort" -}}
{{- index .Values.avalanche.service.ports "http-rpc" }}
{{- end }}

{{/*
Staking port — single source of truth from service.ports
*/}}
{{- define "avalanche.stakingPort" -}}
{{- index .Values.avalanche.service.ports "http-staking" }}
{{- end }}
