{{- define "devops-app.fullname" -}}
{{ .Release.Name }}
{{- end }}

{{- define "devops-app.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "devops-app.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "devops-app.serviceAccountName" -}}
default
{{- end }}