## Fundamentos de Observabilidade 
### O que é observabilidade?  
- [x] Diferença entre monitoramento e observabilidade.  
- [x] Importância em sistemas distribuídos e arquiteturas modernas (microservices e cloud).  
### Três pilares da observabilidade:  
- [x] Logs, métricas e traces.  
- Benefícios de uma estratégia de observabilidade eficiente.  

## Logs – Gerenciamento e Análise 
### Conceitos básicos
- [x] O papel dos logs na observabilidade.  
- [x] Estruturação de logs: logs estruturados versus não estruturados.  
### Melhores práticas de geração de logs:  
- [x] Níveis de log (debug, info, warning, error, critical).  
- [x] Contexto e correlação.  
### Ferramentas para coleta e análise de logs:  
- [x] Elastic Stack (Elasticsearch, Logstash, Kibana).  
- [x] Fluentd, Loki e Grafana.  
- [x] Integração com aplicações (exemplo: log4j, Serilog).  

## Métricas – Monitoramento e Visualização 
### Introdução às métricas:  
- [x] Métricas de infraestrutura vs. métricas de aplicação.  
- [x] Coleta de métricas com agentes e bibliotecas.  
### Ferramentas de monitoramento:  
- [x] Prometheus e Grafana.  
- [x] Outros players (Datadog, New Relic, Zabbix).  
### Melhores práticas:  
- [x] Configuração de dashboards.  
- [x] Definição de KPIs (ex.: tempo de resposta, uso de CPU/memória).  
- [x] Alertas inteligentes com thresholds dinâmicos.  

## Traces – Rastreamento de Transações
### Introdução ao tracing:  
- [x] O que é rastreamento distribuído?  
- [x] Importância em arquiteturas de microsserviços.  
### Ferramentas de tracing:  
- [x] OpenTelemetry.  
- [x] Jaeger e Zipkin.  
### Implementação prática:  
- [x] Instrumentação de serviços.  
- [x] Configuração de spans e propagação de contexto.  
- Análise de transações ponta a ponta.  

## Arquitetura e Integração de Observabilidade
### Arquitetura centralizada de observabilidade:  
- [x] Pipeline de coleta, processamento e armazenamento.  
### Integração entre ferramentas:  
- [x] OpenTelemetry como padrão para logs, métricas e traces.  
- [x] Centralização em plataformas de observabilidade.  
###  Automação de observabilidade em CI/CD pipelines.  

## Boas Práticas e Estudos de Caso
### Boas práticas:  
- [x] Minimizar sobrecarga de coleta de dados.  
- [x] Privacidade e conformidade (GDPR, LGPD).  
- [x] Planejamento de capacidade para armazenamento de dados.  
### Estudos de caso:  
- [x] Implementação de observabilidade em uma aplicação real.  
- [x] Análise de incidentes com logs, métricas e traces.  
- [x] Resolução de problemas de performance.  
