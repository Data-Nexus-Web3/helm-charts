{{/*
Expand the name of the chart.
*/}}
{{- define "envio-indexer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "envio-indexer.fullname" -}}
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
{{- define "envio-indexer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "envio-indexer.labels" -}}
helm.sh/chart: {{ include "envio-indexer.chart" . }}
app.kubernetes.io/name: {{ include "envio-indexer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels.
*/}}
{{- define "envio-indexer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "envio-indexer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Service account name.
*/}}
{{- define "envio-indexer.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "envio-indexer.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Database credentials secret name.
*/}}
{{- define "envio-indexer.databaseSecretName" -}}
{{- required "database.credentials.existingSecret is required" .Values.database.credentials.existingSecret }}
{{- end }}

{{/*
Hasura admin secret name.
*/}}
{{- define "envio-indexer.hasuraSecretName" -}}
{{- required "hasura.adminSecret.existingSecret is required" .Values.hasura.adminSecret.existingSecret }}
{{- end }}

{{/*
HyperSync API token secret name.
*/}}
{{- define "envio-indexer.hypersyncSecretName" -}}
{{- required "dataSources.hypersync.apiToken.existingSecret is required when dataSources.hypersync.enabled=true" .Values.dataSources.hypersync.apiToken.existingSecret }}
{{- end }}

{{/*
Return a database URI with a postgresql scheme normalized to postgres.
Hasura accepts postgres:// URLs.
*/}}
{{- define "envio-indexer.databaseUri" -}}
{{- regexReplaceAll "^postgresql://" .Values.database.uri "postgres://" }}
{{- end }}

{{/*
Return database URI without the postgres:// scheme.
*/}}
{{- define "envio-indexer.databaseUriWithoutScheme" -}}
{{- regexReplaceAll "^postgres://" (include "envio-indexer.databaseUri" .) "" }}
{{- end }}
