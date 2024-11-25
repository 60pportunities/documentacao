Jenkins é um servidor de automação de código aberto, baseado em Java e possui um enormidade de plugins que auxiliam na criação, implantação e automação dos projetos. 
Outra característica peculiar é que Jenkins foi desenvolvido para Integração Contínua (Continuous Integration – CI) e Entrega Contínua (Continuous Delivery – CD), conceitos que juntos com uma cultura DevOps aceleram a conclusão de softwares. 
Tem como uma função principal atuar em toda a pipeline de entrega do software: Construção, Documentação, Teste, Implantação e Análise, facilitando os trabalhos do desenvolvedor. 
Utilizaremos o Docker para efetuar a montagem do ambiente de desenvolvimento, para tal siga os passos de instalação do [Docker](https://docs.docker.com/get-started/get-docker/) ou [60portunities](recipe_60pportunities_conf_docker.md).

## Pré-instalação de plugins
<p align="justify">Esta ferramenta irá executar downloads de centros de atualização, e o acesso à Internet é necessário para os centros de atualização padrão. Para instalar os plugins é possível passar um arquivo que contém esse conjunto de plugins (com ou sem quebras de linha). Por padrão, os plugins serão atualizados se não tiverem sido atualizados manualmente e se a versão da imagem do estivador for mais recente do que a versão no contêiner.As versões instaladas pela imagem são rastreadas através de um arquivo marcador.</p>

Para listar os plugins instalados no jenkins, Painel de controle --> Gerenciar Jenkins --> Console de script, na console cole:

```
println "Lista de plugins instalados"
def plugins = jenkins.model.Jenkins.instance.getPluginManager().getPlugins()
plugins.each {
  println "[${it.getShortName()}]: ${it.getVersion()}" 
}
println "\nCantidad de plugins instalados: ${plugins.size()}"
```

- [x] Para forçar atualizações de plugins que foram atualizados manualmente, execute a imagem do estivador com : `-e PLUGINS_FORCE_UPGRADE=true`
- [x] Efetue a criação de um arquivo `plugins.txt`, como as informações abaixo:

<div class="mdx-columns2" markdown>
- [x] ansible-tower:0.16.0
- [x] ansible:403.v8d0ca_dcb_b_502
- [x] ant:511.v0a_a_1a_334f41b_
- [x] antisamy-markup-formatter:162.v0e6ec0fcfcf6
- [x] apache-httpcomponents-client-4-api:4.5.14-208.v438351942757
- [x] apache-httpcomponents-client-5-api:5.4-118.v199115451c4d
- [x] artifactory:4.0.8
- [x] asm-api:9.7.1-97.v4cc844130d97
- [x] authentication-tokens:1.119.v50285141b_7e1
- [x] aws-credentials:231.v08a_59f17d742
- [x] aws-java-sdk-ec2:1.12.772-474.v7f79a_2046a_fb_
- [x] aws-java-sdk-minimal:1.12.772-474.v7f79a_2046a_fb_
- [x] backup:1.6.1
- [x] basic-branch-build-strategies:81.v05e333931c7d
- [x] blueocean-bitbucket-pipeline:1.27.16
- [x] blueocean-commons:1.27.16
- [x] blueocean-config:1.27.16
- [x] blueocean-core-js:1.27.16
- [x] blueocean-dashboard:1.27.16
- [x] blueocean-display-url:2.4.3
- [x] blueocean-events:1.27.16
- [x] blueocean-git-pipeline:1.27.16
- [x] blueocean-github-pipeline:1.27.16
- [x] blueocean-i18n:1.27.16
- [x] blueocean-jwt:1.27.16
- [x] blueocean-personalization:1.27.16
- [x] blueocean-pipeline-api-impl:1.27.16
- [x] blueocean-pipeline-editor:1.27.16
- [x] blueocean-pipeline-scm-api:1.27.16
- [x] blueocean-rest-impl:1.27.16
- [x] blueocean-rest:1.27.16
- [x] blueocean-web:1.27.16
- [x] bouncycastle-api:2.30.1.78.1-248.ve27176eb_46cb_
- [x] branch-api:2.1178.v969d9eb_c728e
- [x] caffeine-api:3.1.8-133.v17b_1ff2e0599
- [x] checks-api:2.2.1
- [x] cloud-stats:336.v788e4055508b_
- [x] cloudbees-bitbucket-branch-source:888.v8e6d479a_1730
- [x] cloudbees-folder:6.955.v81e2a_35c08d3
- [x] command-launcher:115.vd8b_301cc15d0
- [x] commons-compress-api:1.26.1-2
- [x] commons-httpclient3-api:3.1-3
- [x] commons-lang3-api:3.17.0-84.vb_b_938040b_078
- [x] commons-text-api:1.12.0-129.v99a_50df237f7
- [x] config-file-provider:978.v8e85886ffdc4
- [x] copyartifact:749.vfb_dca_a_9b_6549
- [x] credentials-binding:681.vf91669a_32e45
- [x] credentials:1384.vf0a_2ed06f9c6
- [x] dark-theme:479.v661b_1b_911c01
- [x] data-tables-api:2.1.8-1
- [x] display-url-api:2.204.vf6fddd8a_8b_e9
- [x] docker-commons:443.v921729d5611d
- [x] docker-compose-build-step:1.0
- [x] docker-java-api:3.4.0-94.v65ced49b_a_7d5
- [x] docker-plugin:1.7.0
- [x] docker-slaves:1.0.7
- [x] docker-workflow:580.vc0c340686b_54
- [x] durable-task:577.v2a_8a_4b_7c0247
- [x] echarts-api:5.5.1-2
- [x] eddsa-api:0.3.0-4.v84c6f0f4969e
- [x] email-ext:1844.v3ea_a_b_842374a_
- [x] external-monitor-job:215.v2e88e894db_f8
- [x] favorite:2.221.v19ca_666b_62f5
- [x] font-awesome-api:6.6.0-2
- [x] git-client:5.0.0
- [x] git-parameter:0.9.19
- [x] git-server:126.v0d945d8d2b_39
- [x] git:5.5.2
- [x] github-api:1.321-468.v6a_9f5f2d5a_7e
- [x] github-branch-source:1797.v86fdb_4d57d43
- [x] github-organization-folder:1.6
- [x] github:1.40.0
- [x] gradle:2.13.1
- [x] gson-api:2.11.0-85.v1f4e87273c33
- [x] handy-uri-templates-2-api:2.1.8-30.v7e777411b_148
- [x] htmlpublisher:1.36
- [x] instance-identity:201.vd2a_b_5a_468a_a_6
- [x] ionicons-api:74.v93d5eb_813d5f
- [x] jackson2-api:2.17.0-379.v02de8ec9f64c
- [x] jakarta-activation-api:2.1.3-1
- [x] jakarta-mail-api:2.1.3-1
- [x] javadoc:280.v050b_5c849f69
- [x] javax-activation-api:1.2.0-7
- [x] javax-mail-api:1.6.2-10
- [x] jaxb:2.3.9-1
- [x] jdk-tool:80.v8a_dee33ed6f0
- [x] jenkins-design-language:1.27.16
- [x] jersey2-api:2.44-151.v6df377fff741
- [x] jjwt-api:0.11.5-112.ve82dfb_224b_a_d
- [x] joda-time-api:2.13.0-93.v9934da_29b_a_e9
- [x] jquery:1.12.4-1
- [x] jquery3-api:3.7.1-2
- [x] jsch:0.2.16-86.v42e010d9484b_
- [x] json-api:20240303-101.v7a_8666713110
- [x] json-path-api:2.9.0-118.v7f23ed82a_8b_8
- [x] junit:1304.vc85a_b_ca_96613
- [x] ldap:725.v3cb_b_711b_1a_ef
- [x] mailer:488.v0c9639c1a_eb_3
- [x] matrix-auth:3.2.2
- [x] matrix-project:839.vff91cd7e3a_b_2
- [x] maven-plugin:3.23
- [x] metrics:4.2.21-451.vd51df8df52ec
- [x] mina-sshd-api-common:2.14.0-133.vcc091215a_358
- [x] mina-sshd-api-core:2.14.0-133.vcc091215a_358
- [x] okhttp-api:4.11.0-172.vda_da_1feeb_c6e
- [x] pam-auth:1.11
- [x] periodicbackup:2.0
- [x] pipeline-build-step:540.vb_e8849e1a_b_d8
- [x] pipeline-github-lib:61.v629f2cc41d83
- [x] pipeline-graph-analysis:216.vfd8b_ece330ca_
- [x] pipeline-input-step:495.ve9c153f6067b_
- [x] pipeline-maven-api:1457.vf7a_de13b_c0d4
- [x] pipeline-maven:1457.vf7a_de13b_c0d4
- [x] pipeline-milestone-step:119.vdfdc43fc3b_9a_
- [x] pipeline-model-api:2.2214.vb_b_34b_2ea_9b_83
- [x] pipeline-model-declarative-agent:1.1.1
- [x] pipeline-model-definition:2.2214.vb_b_34b_2ea_9b_83
- [x] pipeline-model-extensions:2.2214.vb_b_34b_2ea_9b_83
- [x] pipeline-rest-api:2.34
- [x] pipeline-stage-step:312.v8cd10304c27a_
- [x] pipeline-stage-tags-metadata:2.2214.vb_b_34b_2ea_9b_83
- [x] pipeline-stage-view:2.34
- [x] pipeline-utility-steps:2.18.0
- [x] plain-credentials:183.va_de8f1dd5a_2b_
- [x] plugin-util-api:5.1.0
- [x] pubsub-light:1.18
- [x] resource-disposer:0.24
- [x] scm-api:696.v778d637b_a_762
- [x] script-security:1365.v4778ca_84b_de5
- [x] snakeyaml-api:2.3-123.v13484c65210a_
- [x] sse-gateway:1.27
- [x] ssh-agent:376.v8933585c69d3
- [x] ssh-credentials:343.v884f71d78167
- [x] ssh-slaves:2.973.v0fa_8c0dea_f9f
- [x] ssh-steps:2.0.68.va_d21a_12a_6476
- [x] sshd:3.330.vc866a_8389b_58
- [x] structs:338.v848422169819
- [x] theme-manager:262.vc57ee4a_eda_5d
- [x] thinBackup:2.1.1
- [x] timestamper:1.27
- [x] token-macro:400.v35420b_922dcb_
- [x] trilead-api:2.147.vb_73cc728a_32e
- [x] variant:60.v7290fc0eb_b_cd
- [x] windows-azure-storage:419.v4046cd70d2e3
- [x] workflow-aggregator:600.vb_57cdd26fdd7
- [x] workflow-api:1336.vee415d95c521
- [x] workflow-basic-steps:1058.vcb_fc1e3a_21a_9
- [x] workflow-cps-global-lib:612.v55f2f80781ef
- [x] workflow-cps:3975.v567e2a_1ffa_22
- [x] workflow-durable-task-step:1371.vb_7cec8f3b_95e
- [x] workflow-job:1436.vfa_244484591f
- [x] workflow-multibranch:795.ve0cb_1f45ca_9a_
- [x] workflow-scm-step:427.v4ca_6512e7df1
- [x] workflow-step-api:678.v3ee58b_469476
- [x] workflow-support:926.v9f4f9b_b_98c19
- [x] ws-cleanup:0.47
</div>

### Dockerfile
```
FROM jenkins/jenkins:lts-jdk17
LABEL Author="60portunities" 
USER root
RUN apt-get update && apt-get install -y make git
RUN mkdir /srv/backup && chown jenkins:jenkins /srv/backup
USER jenkins
RUN echo lts-jdk17 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
RUN echo lts-jdk17 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
COPY --chown=jenkins:jenkins config_jenkins /var/jenkins_home
```

### Script Shell
```
#!/bin/bash
docker system df  # 
docker build . --tag <usuario-dockerhub.com>/devops-jenkins:1.0.0
#docker build . --tag <usuario-dockerhub.com>/devops-jenkins:1.0.0
docker login <usuario-dockerhub.com>
docker push <usuario-dockerhub.com>/devops-jenkins:1.0.0
docker run --detach --name <usuario-dockerhub.com>-jenkins -e PLUGINS_FORCE_UPGRADE=true -p 8082:8080 <usuario-dockerhub.com>/devops-jenkins:1.0.0
```

### Executando
Para publicar no docker-hub e posteriormente executa-lo efetuamos os seguintes passos: 

- [x] Acesse o repositório: `https://hub.docker.com/repositories/<usuario-dockerhub.com>`
- [x] Efetua o login no docker-hub: `docker login <usuario-dockerhub.com>`
- [x] Cria a imagem : `docker build . --tag <usuario-dockerhub.com>/devops-jenkins:1.0.0`
- [x] Publica a imagem no Docker-hub: `docker push <usuario-dockerhub.com>/devops-jenkins:1.0.0` 
- [x] Para remover a imagem : `docker build . --tag <usuario-dockerhub.com>/devops-jenkins:1.0.0`
- [x] Agora vamos subir container Jenkins: `docker run --detach --name docker-jenkins -v jenkins_home:/var/jenkins_home -v jenkins_backup:/srv/backup -p 8082:8080 <usuario-dockerhub.com>/devops-jenkins:1.0.0`
- [x] Listar as imagens no docker: `docker images`
- [x] Listar Containers em Execução: `docker ps`
- [x]  Listar Todos os Containers: `docker ps -a`
- [x] Logs: `docker logs <id|name>`
- [x] Para remover containers: `docker rm <id|name>`
- [x] Para remover imagens: `docker rmi <id|name>`
