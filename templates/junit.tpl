<?xml version="1.0" ?> 
<testsuites> 
{{- range . -}} 
{{- $failures := len .Vulnerabilities }} 
    <testsuite testes="1" falhas="{{ $failures }}" time="" name="{{ .Target }}"> 
    {{- se não (eq .Type "") }} 
        <properties> 
            <property name="type" value="{{ .Type }}"></property> 
        </properties> 
        {{- end -}} 
        {{ intervalo .Vulnerabilities }} 
        <testcase classname="{{ .PkgName }}-{{ .InstalledVersion }}" name="[{{ .Vulnerability.Severity }}] {{ .VulnerabilityID }}" time=""> < 
            falha mensagem={{escapeXML.Título | printf "%q" }} type="description">{{escapeXML .Description | printf "%q" }}</failure> 
        </testcase> 
    {{- end }} 
    </testsuite> 
{{- end }} 
</testsuites>
