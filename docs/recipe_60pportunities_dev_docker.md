O Docker facilita o encapsulamento de seus aplicativos e serviços em contêineres para que você possa executá-los em qualquer lugar. O Docker fornece todas as ferramentas necessárias para limpar seu sistema a partir da linha de comando. Este guia no estilo folha de dicas fornece uma referência rápida para comandos que são úteis para liberar espaço em disco e manter seu sistema organizado removendo imagens, contêineres e volumes do Docker não utilizados.

No entanto, conforme você trabalha com o Docker, também é fácil acumular um número excessivo de imagens, contêineres e volumes de dados não utilizados que desorganizam a saída e consomem espaço em disco.

Para remover completamente o Docker do seu sistema, você precisará remover quaisquer imagens , contêineres e volumes que foram criados. Para fazer isso, use os seguintes comandos:
   
| Uso                   | Comando                                    |
| --------              | -----                                      |
| Remove unused data    | docker system prune --all --volumes        |
| Remove all services   | docker service rm $(docker service ls -q)  |
| Remove all containers | docker rm -f $(docker ps -aq)              |
| Remove all images     | docker rmi -f $(docker images -aq)         | 
| Remove all volumes    | docker volume rm $(docker volume ls -q)    |

## Gerenciador de Container - Portainer
Portainer é uma plataforma centralizada de gerenciamento de contêineres que acelera a adoção de contêineres, reduz a complexidade operacional e aborda os desafios de executar contêineres no Docker, Docker Swarm, Podman e Kubernetes. Ele ajuda você a começar e acelerar a adoção inteligente com um portal de gerenciamento inovador e de autoatendimento.

O Portainer consiste em dois elementos: o Portainer Server e o Portainer Agent.

![](img/portainer-001.png){width="900" height="600" style="display: block; margin: 0 auto"}

### Centro de dados
O Portainer for Datacenter é a solução recomendada para usuários implantarem o Portainer para gerenciar clusters de tempo de execução de contêineres em sua própria nuvem ou datacenters locais, ou seja, na rede privada. Nesse caso, a implantação do Portainer e dos Agentes será localizada em sua própria rede privada. 
![](img/portainer-002.png){width="900" height="600" style="display: block; margin: 0 auto"}
### Computação de Borda
O Portainer for Edge é a solução recomendada para usuários implantarem e configurarem o Portainer para permitir que dispositivos de computação de ponta, por exemplo, dispositivos IoT, estabeleçam conexões entre os dois.
Em termos de arquitetura para edge computing, a arquitetura de alto nível é muito semelhante à versão do datacenter, mas as diferenças serão:
Um firewall será utilizado para hospedar publicamente os endpoints da API HTTPS (porta 9443) e do HTTP WebSocket Tunnel (porta 8000) do Portainer.
O tipo de agente Async Edge requer apenas o ponto de extremidade da API HTTPS (porta 9443).
O diagrama a seguir descreve como o Portainer e os agentes de borda devem ser implantados em seu ambiente:
![](img/portainer-003.png){width="900" height="600" style="display: block; margin: 0 auto"}
### Instalação do Portainer
Primeiro, crie o volume que o Portainer Server usará para armazenar seu banco de dados: 
- [x] `docker volume create portainer_data`
Em seguida, baixe e instale o contêiner do Portainer Server: 
- [x] `docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.21.3`

### Install SigNoz Using Docker Compose
SigNoz é uma ferramenta de observabilidade de código aberto alimentada pela OpenTelemetry. Você pode usar o SigNoz para monitorar seus aplicativos e infraestrutura e obter insights sobre eles. Ele suporta uma ampla variedade de sinais de telemetria, como logs, métricas, traces e exceções, para que você possa usar o SigNoz como uma ferramenta de observabilidade completa para monitorar seus aplicativos.

- [x] `git clone -b main https://github.com/SigNoz/signoz.git && cd signoz/deploy/`
- [x] `docker compose -f docker/clickhouse-setup/docker-compose.yaml up -d`


# Portas

| Porta    | Software         | Motivo           |
| -----    | --------         | ---------        |
| 8000     | Portainer        | Ela só é necessária para aqueles que planejam usar os recursos de computação Edge com agentes Edge.  |
| 9000     | Portainer        | Portainer também pode ser acessado pela porta 9000 por motivos de legado.                            |
| 9443     | Portainer        | Interface baseada na web.                                                                            |
| 8080     | SigNoz           | Interface baseada na web.                                                                            |
| 3301     | SigNoz           | Interface baseada na web.                                                                            |
| 3888     | SigNoz           | clickhouse-setup                                                                                     |
| 2181     | SigNoz           | clickhouse-setup                                                                                     |
| 2888     | SigNoz           | clickhouse-setup                                                                                     |
| 8123     | SigNoz           | clickhouse-setup                                                                                     |
| 9000     | SigNoz           | clickhouse-setup                                                                                     |
| 9181	   | SigNoz           | clickhouse-setup                                                                                     |
| 4317     | SigNoz           | Dados de Telemetria                                                                                  |
| 4318     | SigNoz           | Dados de Telemetria                                                                                  |

# Convenção de Nomeação em tags
A convenção de nomenclatura para as tags no Docker Hub segue o formato <repository_name>:<tag>, onde o nome do repositório é 60pportunities/objeto e onde a tag especifica a versão da imagem. No caso do LTS e das versões mais recentes, as tags são lts  a latest, respectivamente.


A seguir estão os 6 estágios de alto nível de um processo típico de inicialização do Linux.

![](img/linux-boot-process.png){width="300" height="225" style="display: block; margin: 0 auto" }

|  Processo | Entenda                                                                                                   |
| -----     | ------                                                                                                    |
| BIOS      | Executa algumas verificações de integridade do sistema.                                                   |
|           | Pesquisa, carrega e executa o programa carregador de boot.                                                |
|           | Ele procura o carregador de boot em uma unidade externa  ou disco rígido.                                 |
|           | Uma vez que o programa carregador de boot é detectado e carregado na memória, o BIOS dá o controle a ele. |
|           | Então, em termos simples, o BIOS carrega e executa o carregador de boot MBR.                              |
|
| MBR       | significa Registro mestre de inicialização.         |
|           | Ele está localizado no primeiro setor do disco inicializável. Normalmente /dev/hda ou /dev/sda            |
|           | O MBR tem menos de 512 bytes de tamanho. Isso tem três componentes 
|           | 1) informações do carregador de inicialização primário nos primeiros 446 bytes  |
|           | 2)  Informações da tabela de partição nos próximos 64 bytes | 
|           | 3) verificação de validação do mbr nos últimos 2 bytes. |
|           | Contém informações sobre o GRUB (ou LILO em sistemas antigos). |
|           | Então, em termos simples, o MBR carrega e executa o carregador de boot GRUB. |
|           | |
| GRUB      | significa Grand Unified Bootloader. |
|           | Se você tiver várias imagens de kernel instaladas no seu sistema, poderá escolher qual delas será executada. |
|           | GRUB exibe uma tela inicial, aguarda alguns segundos, se você não inserir nada, ele carrega a imagem padrão do kernel conforme especificado no arquivo de configuração do grub. |
|           | GRUB tem conhecimento do sistema de arquivos (o antigo carregador Linux LILO não entendia o sistema de arquivos). |
|           | O arquivo de configuração do Grub é /boot/grub/grub.conf (/etc/grub.conf é um link para isso).                    |
|           | Como você notou nas informações acima, ele contém o kernel e a imagem initrd.                                     |
|           | Então, em termos simples, o GRUB apenas carrega e executa imagens do Kernel e do initrd.                          |
| KERNEL    | Monta o sistema de arquivos raiz conforme especificado em “root=” em grub.conf |
|           | Kernel executa o programa /sbin/init |
|           | Como o init foi o primeiro programa a ser executado pelo Kernel Linux, ele possui o ID do processo (PID) igual a 1. Faça um 'ps -ef | grep init' e verifique o pid. |
|           | initrd significa disco RAM inicial. |
|           | initrd é usado pelo kernel como sistema de arquivo raiz temporário até que o kernel seja inicializado e o sistema de arquivo raiz real seja montado. Ele também contém os drivers necessários compilados internamente, o que o ajuda a acessar as partições do disco rígido e outros hardwares. |
| Init      | Examina o arquivo /etc/inittab para decidir o nível de execução do Linux. |
|           | A seguir estão os níveis de exec |ução disponíveis |
|           | 0 – parar |
|           | 1 – Modo de usuário único |
|           | 2 – Multiusuário, sem NFS |
|           | 3 – Modo multiusuário completo |
|           | 4 – não utilizado |
|           | 5 – X11 |
|           | 6 – reiniciar |
|           | Init identifica o nível de inicialização padrão de /etc/inittab e o usa para carregar todos os programas apropriados. |
|           | Execute 'grep initdefault /etc/inittab' em seu sistema para identificar o nível de execução padrão |
|           | Se quiser ter problemas, você pode definir o nível de execução padrão como 0 ou 6. Como você sabe o que significam 0 e 6, provavelmente não fará isso. |
|           | Normalmente você definiria o nível de execução padrão como 3 ou 5. |
| Runlevel programs | (Programas de nível de execução)     |
|           | Quando o sistema Linux estiver inicializando, você pode ver vários serviços sendo iniciados. Por exemplo, pode dizer “iniciando sendmail …. OK”. Esses são os programas de nível de execução, executados a partir do diretório de nível de execução conforme definido pelo seu nível de execução. |
|           | Dependendo da configuração padrão do nível de inicialização, o sistema executará os programas de um dos seguintes diretórios. |
|           | Execute o nível 0 – /etc/rc.d/rc0.d/ |
|           | Execute o nível 1 – /etc/rc.d/rc1.d/ |
|           | Execute o nível 2 – /etc/rc.d/rc2.d/ |
|           | Execute o nível 3 – /etc/rc.d/rc3.d/ |
|           | Execute o nível 4 – /etc/rc.d/rc4.d/ |
|           | Execute o nível 5 – /etc/rc.d/rc5.d/ |
|           | Execute o nível 6 – /etc/rc.d/rc6.d/ |
|           | Observe que também existem links simbólicos disponíveis para esses diretórios diretamente em /etc. Portanto, /etc/rc0.d está vinculado a /etc/rc.d/rc0.d. |
|           | Nos diretórios /etc/rc.d/rc*.d/, você veria programas que começam com S e K. |
|           | Os programas iniciados com S são usados durante a inicialização. S para inicialização. |
|           | Os programas iniciados com K são usados durante o desligamento. K para matar. |
|           | Existem números ao lado de S e K nos nomes dos programas. Esses são os números de sequência em que os programas devem ser iniciados ou encerrados. |
|           | Por exemplo, S12syslog deve iniciar o daemon syslog, que tem o número de sequência 12. S80sendmail deve iniciar o daemon sendmail, que tem o número de sequência 80. Portanto, o programa syslog será iniciado antes do sendmail. |

# Arquitetura Docker 

![](img/layers.webp){width="600" height="450" style="display: block; margin: 0 auto" }

|  Processo | Entenda                                                                                                   |
| -----     | ------                                                                                                    |
| Servidor Docker | Daemon Docker é um programa que roda no “plano de fundo” do seu computador ou máquina, e que faz o gerenciamento dos containers e imagens do Docker.|
| Cliente Docker  | permite que os usuários interajam com o daemon Docker através da interface de linha de comando (CLI). |
| Registro Docker | repositório central que armazena e faz a gestão de imagens.                                           |
| Container Docker |   |

![](img/dockerEstrutura.png){width="600" height="450" style="display: block; margin: 0 auto" }

Uma imagem é um modelo somente leitura com instruções para criar um contêiner Docker.
Um contêiner é uma instância executável de uma imagem.  Em geral, cada contêiner deve fazer uma coisa e fazê-la bem. A seguir estão alguns motivos para executar o contêiner separadamente:
 

Quando um contêiner é executado, ele usa as várias camadas de uma imagem para seu sistema de arquivos. Cada contêiner também obtém seu próprio "espaço de rascunho" para criar/atualizar/remover arquivos. Quaisquer alterações não serão vistas em outro contêiner, mesmo que estejam usando a mesma imagem.

Os volumes fornecem a capacidade de conectar caminhos específicos do sistema de arquivos do contêiner de volta à máquina host.

Uma montagem de volume é uma ótima escolha quando você precisa de um lugar persistente para armazenar os dados do seu aplicativo.  

Volume nomeado: `type=volume,src=my-volume,target=/usr/local/data`

Uma montagem bind é outro tipo de montagem, que permite que você compartilhe um diretório do sistema de arquivos do host para o contêiner.

Montagem de encadernação: `type=bind,src=/path/to/data,target=/usr/local/data`
* docker run -it --mount type=bind,src="$(pwd)",target=/src ubuntu bash

Você pode usar a CLI ou o Docker Desktop para executar seu contêiner com uma montagem de vinculação.

```
docker run -dp 127.0.0.1:3000:3000 \
    -w /app --mount type=bind,src="$(pwd)",target=/app \
    node:18-alpine \
    sh -c "yarn install && yarn run dev"

 docker run -dp 127.0.0.1:3000:3000 --mount type=volume,src=todo-db,target=/etc/todos getting-started
```

## Rede de contêineres

Lembre-se de que os contêineres, por padrão, são executados isoladamente e não sabem nada sobre outros processos ou contêineres na mesma máquina. A resposta é rede. Se você colocar os dois contêineres na mesma rede, eles podem conversar entre si.

```
docker network create todo-app
docker run -it --network some-network --rm mysql mysql -hsome-mysql -uexample-user -p$ docker run --name some-mysql -v /my/own/datadir:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag`
docker run -d \ --network todo-app --network-alias mysql \ -v todo-mysql-data:/var/lib/mysql \ -e MYSQL_ROOT_PASSWORD=secret \ -e MYSQL_DATABASE=todos \     mysql:8.0
docker exec -it <mysql-container-id> mysql -u root -p
git clone https://github.com/nicolaka/netshootdocker run -it --network todo-app nicolaka/netshoot 
dig mysql
definir a MYSQL_PASSWORD_FILEvar fará com que o aplicativo use o conteúdo do arquivo referenciado como a senha de conexão.
cat /run/secrets/secure-secret
eHwX8kV8sFt/y30WASgz8kimnKhUkCrt07XMrmewYr8=
openssl rand -base64 32 | docker secret create secure-secret -
docker service create --secret="secure-secret" redis:alpine
```

O termo “Dockerize” significa adaptar ou configurar um aplicativo ou serviço para funcionar dentro de um contêiner Docker. Quando você “Dockeriza” um aplicativo, você está essencialmente preparando-o para conteinerização usando o Docker, uma plataforma de conteinerização. O processo de Dockerização de um aplicativo envolve criar um Dockerfile, construir uma imagem Docker e executar o aplicativo como um contêiner Docker.

Por que você pode querer empregar o Dockerizing?
A dockerização de seus aplicativos ou serviços oferece diversas vantagens e pode ser benéfica por vários motivos:

* Consistência : Os contêineres Docker encapsulam aplicativos e suas dependências, garantindo que eles sejam executados consistentemente em diferentes ambientes. Isso elimina o problema de “funciona na minha máquina” e torna mais fácil manter a consistência entre os ambientes de desenvolvimento, teste e produção.

* Portabilidade : Os contêineres Docker são altamente portáteis e podem ser executados em qualquer sistema que suporte Docker. Essa portabilidade simplifica o processo de mover aplicativos entre diferentes ambientes, seja desenvolvendo localmente, implantando em um servidor de nuvem ou migrando para uma infraestrutura diferente.

* Isolamento : Os contêineres fornecem isolamento para seus aplicativos, o que significa que eles não interferem uns com os outros ou com o sistema host. Esse isolamento aumenta a segurança e a estabilidade, tornando mais seguro executar vários aplicativos em um único servidor.

* Eficiência : Os contêineres Docker são leves e compartilham o kernel do sistema operacional do host, tornando-os mais eficientes em termos de recursos em comparação à virtualização tradicional. Você pode executar mais contêineres no mesmo hardware, melhorando a utilização de recursos.

* Escalabilidade: O Docker facilita a escalabilidade horizontal de aplicativos adicionando ou removendo instâncias de contêiner. Isso é especialmente valioso para arquiteturas de microsserviços em que os componentes podem ser escalados de forma independente.

* DevOps e CI/CD : Docker é uma tecnologia fundamental nas práticas modernas de DevOps. Ele simplifica o processo de construção, teste e implantação de aplicativos, permitindo ciclos de lançamento mais rápidos. Os contêineres também podem ser orquestrados para implantação e dimensionamento automatizados em pipelines de CI/CD.

* Controle de versão : as imagens do Docker podem ser versionadas, permitindo que você retorne a estados anteriores do seu aplicativo se surgirem problemas durante a implantação. Isso facilita o gerenciamento e a manutenção de diferentes versões do seu software.

* Ecossistema: O Docker tem um rico ecossistema de imagens e ferramentas disponíveis no Docker Hub e no Docker Store. Isso significa que você pode facilmente encontrar e compartilhar contêineres pré-configurados para vários aplicativos e serviços, economizando tempo e esforço.* 

* Gerenciamento de configuração simplificado: as imagens do Docker podem incluir variáveis ​​de ambiente e arquivos de configuração, facilitando o gerenciamento das configurações do aplicativo de forma consistente e reproduzível.

* Otimização de Recursos: O Docker permite que você otimize a alocação de recursos criando contêineres separados para diferentes componentes de um aplicativo. Isso pode levar a uma melhor utilização de recursos e gerenciamento mais fácil de aplicativos complexos.

Em resumo, Dockerizar seus aplicativos ou serviços oferece maior consistência, portabilidade e eficiência, facilitando o gerenciamento e a implantação de software em práticas modernas de desenvolvimento e implantação. É particularmente valioso em DevOps, microsserviços e arquiteturas de aplicativos nativos da nuvem.

Opções - Dependência entre containers
wait-for-it

Na gravação do curso o Wesley utilizou o dockerize para realizar a sincronização entre serviços de containers Docker.

Atualmente o dockerize funciona perfeitamente em ambientes Linux e Windows, mas no MacBook M1 recebemos relatos de problemas de compatibilidade, por isso estamos disponibilizando uma alternativa que supre 100% o uso em comparação ao dockerize e funciona em todas as arquiteturas citadas, além disto é bem mais leve que ele.

Abaixo o repositório com informações sobre a configuração e pontos importantes sobre o [wait-for-it](https://github.com/codeedu/docker-wait-for-it).

* docker - [healthcheck](https://github.com/devfullcycle/docker-healthcheck)

Uma outro opção nativa do Docker é o healthcheck, com ele podemos verificar a integridade de um determinado container x e, caso ele esteja com o status = healthy, um container y pode se conectar à ele.

No repositório abaixo temos mais informações sobre a utilização desta opção.

git clone https://github.com/docker/getting-started-app.git

```
# syntax=docker/dockerfile:1
FROM node:18-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000

docker run -dp 127.0.0.1:3000:3000 getting-started
docker stop <the-container-id>
docker rm <the-container-id>
docker push docker/getting-started
docker login -u YOUR-USER-NAME 
docker tag getting-started YOUR-USER-NAME/getting-started
docker push YOUR-USER-NAME/getting-started 
docker build --platform linux/amd64 -t YOUR-USER-NAME/getting-started .
docker build -t ofs:latest . --no-cache
docker run --rm -itd --name myOFS -v=<yourintallationfolder>:/home/intelFPGA_pro/:ro -v=DataOFS:/dataofs ofs:latest /bin/bash
ENV no_proxy=   #you could use  github.com here
ENV http_proxy= #setup proxy
ENV https_proxy=  #setup proxy
ENV GITUSER= #setup github user
ENV GITTOKEN= #setup github token
ENV REDUSER= #redhat user 
ENV REDPASS= #redhat password
ENV DW_LICENSE_FILE= #DW license
ENV SNPSLMD_LICENSE_FILE= #Synopsys license
ENV LM_LICENSE_FILE= #Quartus License

systemctl status
Em Linux precisamos entender dois componentes fundamentais: cgroups, namespaces, OFS - Overlay File System.

Os namespaces são responsáveis por gerar o isolamento de grupos de processos em seu nível lógico, como o gerenciamento de usuários, rede, etc., garantido que o container não enxergue os processos do host e vice-versa. Logo, ao criar um container, são criados namespaces como PID (Process ID) para isolar processos, NET (Network) para controlar e isolar as redes de cada container, IPC (Inter Process Communication) que permite a comunicação entre processos, etc.
É isso que se chama namespace, é um espaço separado de nomes, no caso de PIDs.
``` 
ps aux
sudo unshare --fork --pid --mount-proc /bin/bash. 
ps aux
``` 

Olha só, cadê todos os meus processos? Sumiu? O bash agora tem PID 1.

A diferença é que o bash que acabamos de abrir não enxerga mais o mesmo "/proc" global. Ele tem um "/proc" 

wget https://github.com/ericchiang/containers-

Cgroups são basicamente a tecnologia que nos permite definir limites de uso de recursos em processos Linux. 
```
ls /sys/fs/cgroup
systemctl status
cat /proc/PID/group
```

Posso configurar outros limites, como memória, mas pra esse exemplo, só isso já funciona. 

Agora vou abrir um shell dentro desse cgroup com este comando `systemd-run --slice=akita.slice --uid=akitaonrails --shell`

A Open Container Initiative (OCI) é uma comunidade técnica de código aberto na qual os participantes do setor podem contribui

----------- Inicio do Dockerfile
# LICENSE UPL 1.0
#
# Copyright (c) 1982-2017 Oracle and/or its affiliates. All rights reserved.
#
# ORACLE DOCKERFILES PROJECT
# --------------------------
# This is the Dockerfile for Oracle Rest Data Services
#
# REQUIRED FILES TO BUILD THIS IMAGE
# ----------------------------------
# (1) ords.3.0.10.165.06.53.zip
#     Download Oracle Rest Data Services from
#     http://www.oracle.com/technetwork/developer-tools/rest-data-services/downloads/index.html
#
# HOW TO BUILD THIS IMAGE
# -----------------------
# Put the downloaded file in the same directory as this Dockerfile
# Run: 
#      $ docker build -t oracle/restdataservices:3.0.10 . 
#
# Pull base image
# ---------------

ARG BASE_IMAGE=container-registry.oracle.com/java/serverjre:latest
FROM ${BASE_IMAGE}

# Labels
# ----------
LABEL maintainer "horacio.vasconcellos@gmail.com"

# Environment variables required for this build (do NOT change)
# -------------------------------------------------------------
ENV ORDS_HOME=/opt/oracle/ords \
    INSTALL_FILE=ords*.zip \
    CONFIG_PROPS="ords_params.properties.tmpl" \
    STANDALONE_PROPS="standalone.properties.tmpl" \
    RUN_FILE="runOrds.sh"

# Copy binaries
# -------------
COPY $INSTALL_FILE $CONFIG_PROPS $STANDALONE_PROPS $RUN_FILE $ORDS_HOME/

# ARG for installing APEX prerequisites
ARG INCLUDE_APEX=true

# Setup filesystem and oracle user
# Adjust file permissions, go to /opt/oracle as user 'oracle' to proceed with ORDS installation
# ------------------------------------------------------------
RUN if [ ! -e ${ORDS_HOME}/${INSTALL_FILE} ]; then curl https://download.oracle.com/otn_software/java/ords/ords-21.4.2.062.1806.zip -o $ORDS_HOME/ords-latest.zip; fi && \
    mkdir -p  $ORDS_HOME/doc_root $ORDS_HOME/config/ords && \
    chmod ug+x $ORDS_HOME/*.sh && \
    groupadd -g 54322 dba && \
    useradd -u 54321 -d /home/oracle -g dba -m -s /bin/bash oracle && \
    if [ $INCLUDE_APEX == "true" ]; then \
        yum -y install oracle-instantclient-release-el7 && \
        yum -y install oracle-instantclient-sqlplus.x86_64 && \
        cd "${ORDS_HOME}"/config/ && \
        curl https://download.oracle.com/otn_software/apex/apex-latest.zip -o apex-latest.zip && \
        jar -xvf apex-latest.zip && \
        rm apex-latest.zip; \
    fi && \
    cd $ORDS_HOME && \
    jar -xf $INSTALL_FILE && \
    rm $INSTALL_FILE  && \
    java -jar $ORDS_HOME/ords.war configdir $ORDS_HOME/config && \
    chown -R oracle:dba $ORDS_HOME && \
    yum install -y tar && \
    rm -rf /var/cache/yum && \
    rm -rf /var/tmp/yum-*
    
# Finalize setup
# -------------------
USER oracle
WORKDIR /home/oracle

VOLUME ["$ORDS_HOME/config/ords"]
EXPOSE 8443

# Define default command to start Oracle Database.
CMD $ORDS_HOME/$RUN_FILE
----------- FIm do Dockerfile


--------Inicio buildContainerImage.sh
#!/bin/bash
# 
# Since: February, 2017
# Author: gerald.venzl@oracle.com
# Description: Build script for building Oracle Rest Data Services Docker images.
# 
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
# 
# Copyright (c) 2014-2017 Oracle and/or its affiliates. All rights reserved.
# 

usage() {
  cat << EOF

Usage: buildContainerImage.sh [-i] [-o] [Docker build option]
Builds a Docker Image for Oracle Rest Data Services
  
Parameters:
   -i: ignores the MD5 checksums
   -o: passes on Docker build option

LICENSE UPL 1.0

Copyright (c) 2014-2017 Oracle and/or its affiliates. All rights reserved.

EOF
  exit 0
}

# Validate packages
checksumPackages() {
  # Check if Checksum file exists
  if [ -f "Checksum.$VERSION" ]; then
    echo "Checking if required packages are present and valid..."
    md5sum -c "Checksum.$VERSION"
    ret=$?
    if [ "$ret" -ne 0 ]; then
      echo "MD5 for required packages to build this image did not match!"
      echo "Make sure to download missing files."
      exit "$ret"
    fi
  fi
}

# Check container runtime
checkContainerRuntime() {
  CONTAINER_RUNTIME=$(which docker 2>/dev/null) ||
    CONTAINER_RUNTIME=$(which podman 2>/dev/null) ||
    {
      echo "No docker or podman executable found in your PATH"
      exit 1
    }

  if "${CONTAINER_RUNTIME}" info | grep -i -q buildahversion; then
    checkPodmanVersion
  else
    checkDockerVersion
  fi
}

# Check Podman version
checkPodmanVersion() {
  # Get Podman version
  echo "Checking Podman version."
  PODMAN_VERSION=$("${CONTAINER_RUNTIME}" info --format '{{.host.BuildahVersion}}' 2>/dev/null ||
                   "${CONTAINER_RUNTIME}" info --format '{{.Host.BuildahVersion}}')
  # Remove dot in Podman version
  PODMAN_VERSION=${PODMAN_VERSION//./}

  if [ -z "${PODMAN_VERSION}" ]; then
    exit 1;
  elif [ "${PODMAN_VERSION}" -lt "${MIN_PODMAN_VERSION//./}" ]; then
    echo "Podman version is below the minimum required version ${MIN_PODMAN_VERSION}"
    echo "Please upgrade your Podman installation to proceed."
    exit 1;
  fi
}

# Check Docker version
checkDockerVersion() {
  # Get Docker Server version
  echo "Checking Docker version."
  DOCKER_VERSION=$("${CONTAINER_RUNTIME}" version --format '{{.Server.Version | printf "%.5s" }}'|| exit 0)
  # Remove dot in Docker version
  DOCKER_VERSION=${DOCKER_VERSION//./}

  if [ "${DOCKER_VERSION}" -lt "${MIN_DOCKER_VERSION//./}" ]; then
    echo "Docker version is below the minimum required version ${MIN_DOCKER_VERSION}"
    echo "Please upgrade your Docker installation to proceed."
    exit 1;
  fi;
}

# Parameters
VERSION=""
SKIPMD5=0
MIN_DOCKER_VERSION="17.09"
MIN_PODMAN_VERSION="1.6.0"
DOCKEROPS=""

while getopts "hio:" optname; do
  case "$optname" in
    "h")
      usage
      ;;
    "i")
      SKIPMD5=1
      ;;
    "o")
      DOCKEROPS="$OPTARG"
      ;;
    "?")
      usage;
      exit 1;
      ;;
    *)
    # Should not occur
      echo "Unknown error while processing options inside buildDockerImage.sh"
      ;;
  esac
done

# Check that we have a container runtime installed
checkContainerRuntime

# Determine latest version
# Do this after the options so that users can still do a "-h"
ORDS_ZIP_COUNT="$(ls -al ords*zip 2>/dev/null | wc -l)"
if [ "${ORDS_ZIP_COUNT}" -eq 0 ]; then
  VERSION="latest"
elif [ "${ORDS_ZIP_COUNT}" -gt 1 ]; then
  echo "ERROR: Found multiple versions of ORDS zip files.";
  echo "ERROR: Please only put one ORDS zip file into this directory!";
  exit 1;
else
  # #644: using awk as below does not work in macOS bash as it's really gawk (3 params) - see ticket for more info
  # VERSION=$(ls ords*zip 2>/dev/null | awk 'match ($0, /(ords\.)(.{1,2}\..{1,2}\..{1,2})\.(.+.zip)/, result) { print result[2] }')
  ORDS_FILENAME=$(ls ords*zip 2>/dev/null)
  ORDS_FILENAME_REGEXP="(ords(\.|-))(.{1,2}\..{1,2}\..{1,2})(\..*)(zip)"

  if [[ $ORDS_FILENAME =~ $ORDS_FILENAME_REGEXP ]]; then
    VERSION="${BASH_REMATCH[3]}"
  else
    VERSION=""
  fi;

fi;

if [ -z "$VERSION" ]; then
  echo "ERROR: No install file is in this directory!"
  echo "ERROR: Please copy the install file into this directory or refer to the ReadMe!"
  exit 1;
fi;


# Oracle Database Image Name
IMAGE_NAME="oracle/restdataservices:$VERSION"

if [ ! "$SKIPMD5" -eq 1 ] && [ "$VERSION" != "latest" ]; then
  checksumPackages
else
  echo "Ignored MD5 checksum."
fi

echo "=========================="
echo "Container Runtime info:"
"${CONTAINER_RUNTIME}" info
echo "=========================="

# Proxy settings
PROXY_SETTINGS=""
if [ "${http_proxy}" != "" ]; then
  PROXY_SETTINGS="$PROXY_SETTINGS --build-arg http_proxy=${http_proxy}"
fi

if [ "${https_proxy}" != "" ]; then
  PROXY_SETTINGS="$PROXY_SETTINGS --build-arg https_proxy=${https_proxy}"
fi

if [ "${ftp_proxy}" != "" ]; then
  PROXY_SETTINGS="$PROXY_SETTINGS --build-arg ftp_proxy=${ftp_proxy}"
fi

if [ "${no_proxy}" != "" ]; then
  PROXY_SETTINGS="$PROXY_SETTINGS --build-arg no_proxy=${no_proxy}"
fi

if [ "$PROXY_SETTINGS" != "" ]; then
  echo "Proxy settings were found and will be used during build."
fi

# ################## #
# BUILDING THE IMAGE #
# ################## #
echo "Building image '$IMAGE_NAME' ..."

# BUILD THE IMAGE (replace all environment variables)
BUILD_START=$(date '+%s')
"${CONTAINER_RUNTIME}" build --force-rm=true --no-cache=true $DOCKEROPS $PROXY_SETTINGS \
             -t $IMAGE_NAME -f Dockerfile . || {
  echo "There was an error building the image."
  exit 1
}
BUILD_END=$(date '+%s')
BUILD_ELAPSED=$((BUILD_END - BUILD_START))

echo ""

cat << EOF
  Oracle Rest Data Services version $VERSION is ready to be extended: 
    
    --> $IMAGE_NAME

  Build completed in $BUILD_ELAPSED seconds.
  
EOF
--------Fim    buildContainerImage.sh


---- Inicio ords_params.properties.tmpl
rest.services.ords.add=true
database.api.enabled=true
db.hostname=###ORACLE_HOST###
db.port=###ORACLE_PORT###
db.servicename=###ORACLE_SERVICE###
plsql.gateway.add=false
rest.services.apex.add=false
rest.services.ords.add=true
standalone.http.port=8888
standalone.mode=false
standalone.use.https=true
sys.user=SYS
sys.password=###ORACLE_PWD###
user.public.password=###ORDS_PWD###
pdb.skip.readonly=true
---- Termino ords_params.properties.tmpl

--- Inicio OracleRestDataServices/dockerfiles/runOrds.sh
#!/bin/bash

CONTEXT_ROOT=${CONTEXT_ROOT:-"ords"}
CONTEXT_ROOT=$(echo "${CONTEXT_ROOT}" | sed 's/\///g')
if [ "$CONTEXT_ROOT" != "ords" ]; then
  if mv $ORDS_HOME/ords.war $ORDS_HOME/$CONTEXT_ROOT.war; then
    echo "INFO: Renamed ords.war to $CONTEXT_ROOT.war"
  else
    echo "ERROR: Failed renaming ords.war to $CONTEXT_ROOT.war. Exiting..."
    exit 1
  fi
fi

function setupOrds() {

  # Check whether the Oracle DB password has been specified
  if [ "$ORACLE_PWD" == "" ]; then
    echo "Error: No ORACLE_PWD specified!"
    echo "Please specify Oracle DB password using the ORACLE_PWD environment variable."
    exit 1;
  fi;

  # Defaults
  ORACLE_SERVICE=${ORACLE_SERVICE:-"ORCLPDB1"}
  ORACLE_HOST=${ORACLE_HOST:-"localhost"}
  ORACLE_PORT=${ORACLE_PORT:-"1521"}
  ORDS_PWD=${ORDS_PWD:-"oracle"}
  APEXI=${APEXI:-"$ORDS_HOME/doc_root/i"}
  
  # Make standalone dir
  mkdir -p $ORDS_HOME/config/$CONTEXT_ROOT/standalone
  
  # Copy template files
  cp $ORDS_HOME/$CONFIG_PROPS $ORDS_HOME/params/ords_params.properties
  cp $ORDS_HOME/$STANDALONE_PROPS $ORDS_HOME/config/$CONTEXT_ROOT/standalone/standalone.properties

  # Replace DB related variables (ords_params.properties)
  sed -i -e "s|###ORACLE_SERVICE###|$ORACLE_SERVICE|g" $ORDS_HOME/params/ords_params.properties
  sed -i -e "s|###ORACLE_HOST###|$ORACLE_HOST|g" $ORDS_HOME/params/ords_params.properties
  sed -i -e "s|###ORACLE_PORT###|$ORACLE_PORT|g" $ORDS_HOME/params/ords_params.properties
  sed -i -e "s|###ORDS_PWD###|$ORDS_PWD|g" $ORDS_HOME/params/ords_params.properties
  sed -i -e "s|###ORACLE_PWD###|$ORACLE_PWD|g" $ORDS_HOME/params/ords_params.properties
  
  # Replace standalone runtime variables (standalone.properties)
  sed -i -e "s|###PORT###|8443|g" $ORDS_HOME/config/$CONTEXT_ROOT/standalone/standalone.properties
  sed -i -e "s|###HOST###|$HOSTNAME|g" $ORDS_HOME/config/$CONTEXT_ROOT/standalone/standalone.properties
  sed -i -e "s|###CONTEXT_ROOT###|$CONTEXT_ROOT|g" $ORDS_HOME/config/$CONTEXT_ROOT/standalone/standalone.properties
  sed -i -e "s|###DOC_ROOT###|$ORDS_HOME/doc_root|g" $ORDS_HOME/config/$CONTEXT_ROOT/standalone/standalone.properties
  sed -i -e "s|###APEXI###|$APEXI|g" $ORDS_HOME/config/$CONTEXT_ROOT/standalone/standalone.properties
   
   # Start ODRDS setup
   java -jar $ORDS_HOME/$CONTEXT_ROOT.war install simple
}

############# MAIN ################

# Check whether ords is already setup
if [ ! -f $ORDS_HOME/config/$CONTEXT_ROOT/standalone/standalone.properties ]; then
   setupOrds;
fi;

if [ "$1" = "--setuponly" ];then
  exit $?
else
  java -jar $ORDS_HOME/$CONTEXT_ROOT.war standalone
fi
--- Termino OracleRestDataServices/dockerfiles/runOrds.sh

--- Inicio OracleRestDataServices/dockerfiles/standalone.properties.tmpl
jetty.secure.port=###PORT###
ssl.cert=
ssl.cert.key=
ssl.host=###HOST###
standalone.access.log=/tmp/ords_log
standalone.context.path=/###CONTEXT_ROOT###
standalone.doc.root=###DOC_ROOT###
standalone.scheme.do.not.prompt=true
standalone.static.context.path=/i
standalone.static.do.not.prompt=true
standalone.static.path=###APEXI###
--- Termino OracleRestDataServices/dockerfiles/standalone.properties.tmpl

--- Install TOMCAT
FROM tomcat:8.0-alpine
LABEL maintainer="deepak@softwareyoga.com"

ADD sample.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]


OU 

FROM ubuntu:16.04

# Install prerequisites
RUN apt-get -y update &amp;&amp; apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN apt-get -y install curl
RUN mkdir /usr/local/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-10/v10.0.20/bin/apache-tomcat-10.0.20.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp  tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-10.0.20/* /usr/local/tomcat/

EXPOSE 8080
# java
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# Define default command.
CMD ["bash"]

MAINTAINER bhaskarndas@gmail.com


WORKDIR /usr/local/tomcat/webapps
RUN curl -O -L https://github.com/bhaskarndas/sample-war/raw/main/sampletest.war


CMD ["https://net.cloudinfrastructureservices.co.uk/usr/local/tomcat/bin/catalina.sh", "run"]


---Fim 

version: "3"

services:

  tomcat_1:
    image: tomcat:9-jdk8-openjdk
    environment:
      VIRTUAL_HOST: t1.my-site.com
      VIRTUAL_PORT: 8080
    restart: always
    volumes:
      - "./tomcat/webapps:/usr/local/tomcat/webapps"
      - "./tomcat/logs:/usr/local/tomcat/logs"

  tomcat_2:
    image: tomcat:9-jdk8-openjdk
    environment:
      VIRTUAL_HOST: t2.my-site.com
      VIRTUAL_PORT: 8080
    restart: always
    volumes:
      - "./tomcat/webapps:/usr/local/tomcat/webapps"
      - "./tomcat/logs:/usr/local/tomcat/logs"

  tomcat_3:
    image: tomcat:9-jdk8-openjdk
    environment:
      VIRTUAL_HOST: t1.my-site.com
      VIRTUAL_PORT: 8080
    restart: always
    volumes:
      - "./tomcat/webapps:/usr/local/tomcat/webapps"
      - "./tomcat/logs:/usr/local/tomcat/logs"

  tomcat_4:
    image: tomcat:9-jdk8-openjdk
    environment:
      VIRTUAL_HOST: t2.my-site.com
      VIRTUAL_PORT: 8080
    restart: always
    volumes:
      - "./tomcat/webapps:/usr/local/tomcat/webapps"
      - "./tomcat/logs:/usr/local/tomcat/logs"

  reverse-proxy:
    image: jwilder/nginx-proxy
    restart: always
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /var/run/docker.sock:/tmp/docker.sock:ro
      - ./nginx/certs:/etc/nginx/certs
      - ./nginx/nginx-proxy.conf:/etc/nginx/conf.d/nginx-proxy.conf:ro
    links:
      - tomcat_1
      - tomcat_2
      - tomcat_3
      - tomcat_4

      nginx-proxy.conf

server {
    listen 80;
    server_name t1.my-site.com;
    return 301 https://$host$request_uri;
}
server {
    listen 443 ;
    server_name t1.my-site.com;
    access_log /var/log/nginx/data-access.log combined;
    location / {
        proxy_pass http://t1.my-site.com:8080/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
   }
server {
    listen 80;
    server_name t2.my-site.com;
    return 301 https://$host$request_uri;
}
server {
    listen 443 ;
    server_name t2.my-site.com;
    access_log /var/log/nginx/data-access.log combined;
    location / {
        proxy_pass http://t2.my-site.com:8080/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}





# Latencia
Existem vários fatores que influenciam uma conexão ruim com a internet, como velocidade ou estabilidade, mas certamente há um que muitas vezes não prestamos a devida atenção: latência. 

O tempo que leva para cada pacote transmitir é o que é conhecido como latência. A latência, medida em milissegundos, é melhor quanto menor for. Ou seja, é menos provável que você sofra cortes em sua chamada de vídeo ou videogame online se a latência da sua conexão for baixa. A latência da rede é expressa em ping. Portanto, a latência é frequentemente conhecida por este mesmo nome. 


A velocidade da conexão representa nossa largura de banda. Quanto maior a velocidade, maiores os pacotes de dados. 
A latência refere-se ao tempo exato que leva para que esses pacotes sejam enviados do servidor


# Cloud ou not cloud, is this question
Empresas em todo o mundo estão optando por repatriar seus dados, abandonando soluções baseadas em nuvem e retornando a servidores locais. 
A repatriação de dados, responde a uma necessidade crescente de controle, segurança e conformidade regulatória.


As 5 principais razões para este movimento seríam:
1. Custos Elevados: Muitas empresas descobrem que os custos de operação na nuvem podem superar os benefícios, especialmente quando o uso é intensivo e contínuo.
2. Necessidade de Controle: Algumas organizações preferem ter um controle mais direto sobre seus dados e infraestrutura, o que pode ser mais difícil de alcançar em ambientes de nuvem compartilhados.
3. Desempenho e Latência: Para aplicações críticas, a latência e o desempenho podem ser melhor gerenciados em um ambiente local do que na nuvem.
4. Segurança e Conformidade: Questões de segurança e conformidade regulatória podem levar empresas a optar por soluções locais para garantir que estão totalmente em conformidade com as leis e normas.
5. Inovação Tecnológica: Com o avanço da tecnologia, algumas empresas encontram soluções mais inovadoras e eficientes fora da nuvem, como edge computing e infraestruturas descentralizadas.



# Comandos Docker

Para aqueles que são totalmente iniciantes no ecossistema Docker, aqui estão algumas explicações para os termos usados ​​no arquivo docker.

FROM  – É a imagem base sobre a qual todo o contêiner será executado. Em outras palavras, você pode dizer que ele fornece o ambiente para o contêiner ser executado dentro do ambiente docker. Neste caso, o ubuntu 16 foi usado, mas outras alternativas também podem ser usadas, como CentOS, alpine, etc. 
Instalar Perquisites – eles são análogos às ferramentas básicas, frameworks e bibliotecas necessárias para configurar e executar um ambiente de desenvolvimento. O comando RUN executará a instalação, atualização e upgrade necessários relacionados a instaladores como java, tomcat, etc.
EXPOSE – Isso permite que o usuário exponha as portas fora do contêiner.
CMD  – O prompt de comando padrão para o contêiner. Sem isso, o contêiner não seria capaz de executar comandos e o contêiner não seria capaz de rodar. É análogo a carregar um sistema Linux em sua máquina local, que compactaria o prompt de comando e começaria a executar comandos para carregar o SO. Aqui, Bash é o shell padrão.
Maintainer – É um parâmetro opcional no Dockerfile. Se você estiver testando para um ambiente local, não é necessário. No entanto, se você estiver mantendo imagens no docker hub, ele identifica o principal mantenedor para aquela imagem em particular.
WORKDIR  – É o espaço de trabalho onde ocorrerá todo o desenvolvimento e implantação de aplicações dentro do container.
Para testar nossa imagem tomcat, estou usando um arquivo war de exemplo hospedado no repositório GitHub . O arquivo war contém um programa hello world simples escrito em JSP. Este JSP será acessado quando a imagem for construída e será executado como um contêiner nas próximas etapas.

Container é imutável... se o container morrer a alteração irá embora

```
docker -it IMAGE bash
docker run -d -p 8081:80 --name nginx nginx
docker exec -it IMAGE bash
docker rm nginx -f

BindMount - Vc monta no seu computador
docker run -d --name nginx -p 8081:80 -v /Users/horaciovasconcellos/docker/html:/usr/share/nginx/html nginx
docker run -d --name nginx -p 8081:80 --mount type=bind,source="$(pwd)"/docker/html, target=/usr/share/nginx/html nginx

Usando volumes, se especificar uma pasta que NÃO exista, no -v ele cria, no mount ele da um erro.


FROM nginx:latest
WORKDIR /app
RUN apt-get update && \
    apt-get install vim -y
COPY html/ /usr/share/nginx/html

docker build -t 77678117787/nginx-com-vim:latest .

docker run -d --name nginx -p 8081:80 --mount type=bind,source="$(pwd)"/docker/html, target=/usr/share/nginx/html 77678117787/nginx-com-vim:latest


docker container prune -f

docker ps -a -q

docker rm $(ps -a -q) -f

docker pull hello-world
```
FROM ubuntu:latest

CMD ["echo", "Alo Mundo"]

docker run --rm 77678117787/nginx-com-vim:latest echo "oi"

docker run 77678117787/nginx-com-vim:latest echo "Horacio"

CMD ["comando", "Parametros"] --

ENTRYPOINT ["echo", "parametros"]


docker build -t 77678117787/nginx-horacio:latest .

docker logout

docker login
```

Alguns tipos de NEtwork

* Bridge  - POnte entre container um fala com o outro
* Host    - Mescla a rede docker com a rede do host da minha máquina
* Overlay - COnsegue que todos se comuniquer (docker Swaarm - Cluster de vários doker)
maclan  - 
none    - 

docker network ls

docker run -it -d --name ubuntu1 bash
docker run -it -d --name ubuntu2 bash
docker network inspect bridge

docker attach ubuntu1
ip addr show

docker network create --driver bridge minhared

docker run -dit --name ubuntu1 --network minharede bash
docker run -dit --name ubuntu2 --network minharede bash


docker network connect minharede ubuntu3


Escolha o sinalizador -v ou --mount
Em geral, --mounté mais explícito e verboso. A maior diferença é que a -vsintaxe combina todas as opções juntas em um campo, enquanto a --mount sintaxe as separa. Aqui está uma comparação da sintaxe para cada flag.

Se você precisar especificar opções de driver de volume, deverá usar --mount.

-vou --volume: Consiste em três campos, separados por dois pontos ( :). Os campos devem estar na ordem correta, e o significado de cada campo não é imediatamente óbvio.

No caso de volumes nomeados, o primeiro campo é o nome do volume, e é exclusivo em uma determinada máquina host. Para volumes anônimos, o primeiro campo é omitido.
O segundo campo é o caminho onde o arquivo ou diretório é montado no contêiner.
O terceiro campo é opcional e é uma lista de opções separadas por vírgulas, como ro. Essas opções são discutidas abaixo.
--mount: Consiste em vários pares de chave-valor, separados por vírgulas e cada um consistindo de uma <key>=<value>tupla. A --mountsintaxe é mais verbosa do que -vor --volume, mas a ordem das chaves não é significativa, e o valor do sinalizador é mais fácil de entender.

O typeda montagem, que pode ser bind, volume, ou tmpfs. Este tópico discute volumes, então o tipo é sempre volume.
O sourceda montagem. Para volumes nomeados, este é o nome do volume. Para volumes anônimos, este campo é omitido. Pode ser especificado como source ou src.
O destinationtoma como valor o caminho onde o arquivo ou diretório está montado no contêiner. Pode ser especificado como destination, dst, ou target.
A readonlyopção, se presente, faz com que a montagem bind seja montada no contêiner como somente leitura . Pode ser especificado como readonlyou ro.
A volume-optopção, que pode ser especificada mais de uma vez, recebe um par chave-valor que consiste no nome da opção e seu valor.

docker service create \
 --mount 'type=volume,src=<VOLUME-NAME>,dst=<CONTAINER-PATH>,volume-driver=local,volume-opt=type=nfs,volume-opt=device=<nfs-server>:<nfs-path>,"volume-opt=o=addr=<nfs-address>,vers=4,soft,timeo=180,bg,tcp,rw"'
 --name myservice \
 IMAGE

 docker run -d \
  --name=nginxtest \
  --mount source=nginx-vol,destination=/usr/share/nginx/html \
  nginx:latest

  Somente Leitura
  docker run -d \
  --name=nginxtest \
  --mount source=nginx-vol,destination=/usr/share/nginx/html,readonly \
  nginx:latest

docker service create -d \
  --name nfs-service \
  --mount 'type=volume,source=nfsvolume,target=/app,volume-driver=local,volume-opt=type=nfs,volume-opt=device=:/var/docker-nfs,volume-opt=o=addr=10.0.0.10' \
  nginx:latest

  docker volume prune
  llama3



Preparação dos arquivos CLOB: Certifique-se de que os arquivos CLOB estejam disponíveis no diretório local. Você pode nomeá-los, por exemplo, como clob1.txt e clob2.txt.
Criando o comando curl: Abra o terminal ou prompt de comando e execute o seguinte comando curl:
curl -X POST -H "Content-Type: application/json" \
     -d '{"clob1": "$(cat clob1.txt)", "clob2": "$(cat clob2.txt)"}' \
     http://seu-servico-url-aqui
Substitua http://seu-servico-url-aqui pela URL do seu serviço Oracle ORDS.
-X POST: Especifica o método HTTP como POST.
-H "Content-Type: application/json": 

Define o cabeçalho para indicar que estamos enviando dados JSON.
-d '{"clob1": "$(cat clob1.txt)", "clob2": "$(cat clob2.txt)"}': Envia os dados JSON com os conteúdos dos arquivos CLOB.
Certifique-se de que o caminho para os arquivos clob1.txt e clob2.txt esteja correto.
Execute o comando: Execute o comando curl no terminal ou prompt de comando. Ele enviará os dados dos arquivos CLOB para o serviço Oracle ORDS.


Curl -X POST http://localhost:8080/ai/rag \
        -H "Content-Type: application/json" \
        -d '{"message":"How is the weather tomorrow?"}' | jq -r .generation


curl -X POST http://localhost:8080/ai/rag \
    -H "Content-Type: application/json" \
    -d '{"message":"To run the example, how can I check if the dbms it is working correctly?"}' | jq -r .generation


sudo /usr/libexec/oci-growfs
    curl -s -L https://nvidia.github.io/libnvidia-container/stable/rpm/nvidia-container-toolkit.repo |   sudo tee /etc/yum.repos.d/nvidia-container-toolkit.repo
    sudo dnf install -y dnf-utils zip unzip
    sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
    sudo dnf remove -y runc
    sudo dnf install -y docker-ce --nobest
    sudo useradd docker_user

    sudo visudo
    docker_user  ALL=(ALL)  NOPASSWD: /usr/bin/docker
    sudo su - docker_user

        sudo /usr/libexec/oci-growfs
    curl -s -L https://nvidia.github.io/libnvidia-container/stable/rpm/nvidia-container-toolkit.repo |   sudo tee /etc/yum.repos.d/nvidia-container-toolkit.repo
    sudo dnf install -y dnf-utils zip unzip
    sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
    sudo dnf remove -y runc
    sudo dnf install -y docker-ce --nobest
    sudo useradd docker_user


docker run -d --gpus=all -v ollama:/root/.ollama -p 11400:11434 --name ollama ollama/ollama serve
docker exec -it ollama ollama pull nomic-embed-text
docker exec -it ollama ollama pull llama2:13b-chat-fp16
docker logs -f --tail 10 ollama

journalctl -e -u ollama
sudo systemctl stop ollama
sudo systemctl disable ollama
sudo rm /etc/systemd/system/ollama.service
sudo rm $(which ollama)
Remove the downloaded models and Ollama service user and group:

sudo rm -r /usr/share/ollama
sudo userdel ollama
sudo groupdel ollama

lsof -i -P -n | grep LISTEN
netstat -tulpn | grep LISTEN
ss -tulpn | grep LISTEN
lsof -i:11434 ## see a specific port such as 22 ##
sudo nmap -sTU -O IP-address-Here


./root/instalacao/rag-chatbot/data/ollama
./root/snap/ollama
./var/lib/docker/overlay2/e1d315d8ce13316b1e7c17da6193443ec56a24ccf94107857bc0f8b4fabf58a3/diff/usr/bin/ollama
./var/lib/docker/overlay2/z7dtfi9jumfrn68l9a15ju5bw/diff/usr/local/lib/python3.11/site-packages/llama_index/llms/ollama
./var/lib/docker/volumes/ollama
./var/lib/snapd/snap/ollama
./var/lib/snapd/snap/ollama/15/bin/ollama
./var/snap/ollama
./tmp/tmp.nGahuNAcrY/ollama

/proc/ filesystem entry. Try the ls command:
ls -l /proc/30216/exe
ls -l /proc/3813/cwd Current Working Directory Of a Process


docker network create <your network name>


docker network create --driver bridge ords-sgbd
docker network ls
    docker run --name oracledb --network=ords-sgbd oracle/database:12.2.0.1-ee


curl http://horaciovasconcellos.com.br:11434/api/generate -d '{"model": "llama3", "prompt": "Qual a origem do nome: Horácio", "format": "json", "stream": false}'


docker service create \
 --mount 'type=volume,src=<VOLUME-NAME>,dst=<CONTAINER-PATH>,volume-driver=local,volume-opt=type=nfs,volume-opt=device=<nfs-server>:<nfs-path>,"volume-opt=o=addr=<nfs-address>,vers=4,soft,timeo=180,bg,tcp,rw"'
 --name myservice \
 IMAGE

 docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
 docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
docker run -d --gpus=all -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama


 -p 5678:5678 \
 -e GENERIC_TIMEZONE="America/Sao_Paulo" -e TZ="America/Sao_Paulo"

docker volume create data

docker run -d -it --rm -e GENERIC_TIMEZONE="America/Sao_Paulo" -e TZ="America/Sao_Paulo" --name n8n -p 5678:5678 -v n8n_data:/home/node/.n8n docker.n8n.io/n8nio/n8n

docker volume create n8n_data

docker run -it --rm \
 --name n8n \
 -p 5678:5678 \
 -e DB_TYPE=postgresdb \
 -e DB_POSTGRESDB_DATABASE=<POSTGRES_DATABASE> \
 -e DB_POSTGRESDB_HOST=<POSTGRES_HOST> \
 -e DB_POSTGRESDB_PORT=<POSTGRES_PORT> \
 -e DB_POSTGRESDB_USER=<POSTGRES_USER> \
 -e DB_POSTGRESDB_SCHEMA=<POSTGRES_SCHEMA> \
 -e DB_POSTGRESDB_PASSWORD=<POSTGRES_PASSWORD> \
 -v n8n_data:/home/node/.n8n \


a .env file and add the following to it:

POSTGRES_USER=ThisIsUser
POSTGRES_PASSWORD=ThisIsPassword
POSTGRES_DB=n8n

POSTGRES_NON_ROOT_USER=ThisIsUser
POSTGRES_NON_ROOT_PASSWORD=ThisIsPassword

N8N_BASIC_AUTH_USER=ThisIsUser
N8N_BASIC_AUTH_PASSWORD=ThisIsPassword

#!/bin/bash
set -e;

if [ -n "${POSTGRES_NON_ROOT_USER:-}" ] && [ -n "${POSTGRES_NON_ROOT_PASSWORD:-}" ]; then
 psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  CREATE USER ${POSTGRES_NON_ROOT_USER} WITH PASSWORD '${POSTGRES_NON_ROOT_PASSWORD}';
  GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_DB} TO ${POSTGRES_NON_ROOT_USER};
 EOSQL
else
 echo "SETUP INFO: No Environment variables given!"
fi


docker pull n8nio/n8n
docker run -it --rm --name n8n -p 5678:5678 -e N8N_BASIC_AUTH_USER=admin -e N8N_BASIC_AUTH_PASSWORD=password -e N8N_SECURE_COOKIE=false  -e GENERIC_TIMEZONE="America/Sao_Paulo"  -e TZ="America/Sao_Paulo" -v n8n_data:/home/node/.n8n n8nio/n8n

 docker volume create n8n_data

docker run -it --rm \
 --name n8n \
 -p 5678:5678 \
 -e GENERIC_TIMEZONE="America/Sao_Paulo" \
 -e TZ="America/Sao_Paulo" \
 -v n8n_data:/home/node/.n8n \
 docker.n8n.io/n8nio/n8n

{"model":"llama3","created_at":"2024-07-07T23:20:08.460442144Z","response":"{\"Obrigado!\" : \"Horacio\"}\n\n\n\n\n\n\n\n\n\n\n\n\n\n","done":true,"done_reason":"stop","context":[128006,882,128007,271,32129,264,2780,336,656,17567,25,15083,30441,822,128009,128006,78191,128007,271,5018,46,83132,2172,9135,551,330,40701,36970,64259,46228,128009],"total_duration":4304552786,"load_duration":883141,"prompt_eval_duration":180844000,"eval_count":13,"eval_duration":4121978000}


git clone -b main https://github.com/SigNoz/signoz.git && cd signoz/deploy/
docker compose -f docker/clickhouse-setup/docker-compose.yaml up -d

docker run -d -it --rm --name n8n -p 5678:5678 -e N8N_BASIC_AUTH_USER=admin -e N8N_BASIC_AUTH_PASSWORD=password -e N8N_SECURE_COOKIE=false -e GENERIC_TIMEZONE="America/Sao_Paulo" -e TZ="America/Sao_Paulo" -v n8n_data:/home/node/.n8n n8nio/n8


docker run -it --rm --name n8n -p 5678:5678 -e N8N_BASIC_AUTH_USER=admin -e N8N_BASIC_AUTH_PASSWORD=password -e N8N_SECURE_COOKIE=false  -e GENERIC_TIMEZONE="America/Sao_Paulo"  -e TZ="America/Sao_Paulo" -v n8n_data:/home/node/.n8n n8nio/n8n

    curl http://localhost:11434/api/generate -d '{"model": "phi3", "prompt": "Qual a origem do nome: Horácio", "format": "json", "stream": false}'



    elabore um modelo relacional entre  cliente, vendedor, região, filial e vendas. Na tabela de cliente e vendedores teremos os campos serão: id, nome e email. 
    Na tabela de região teremos id e nome. Na tabela de filial, teremos id, nome, id da regiao e o endereço(Tipo de Logradouro, Logradouro, numero e complemento)

Em vendas teremos o id do pedido, a data, valor da venda, id_vendedor, id_cliente e id_regiao.


Explicação do Modelo
Cliente e Vendedor têm informações básicas como nome e email, cada um identificado por um ID único.
Região define áreas geográficas ou de mercado distintas, identificadas por um ID único e um nome descritivo.
Filial representa locais físicos onde vendas podem ser realizadas, ligados a uma região específica através do campo id_regiao.
Vendas registra transações individuais, com detalhes como data, valor da venda, e referências aos IDs de cliente, vendedor e região relacionados.
Este modelo permite capturar as relações entre clientes, vendedores, regiões geográficas, filiais e transações de vendas, facilitando a análise e o gerenciamento de informações relacionadas ao processo de vendas e distribuição geográfica das operações.

Elabore um modelo relacional entre  cliente, vendedor, região, filial e vendas. Demonstre com comandos SQL.

Para demonstrar como criar as tabelas e estabelecer as chaves estrangeiras no SQL, vou utilizar o padrão SQL padrão. Se você estiver utilizando um sistema de gerenciamento de banco de dados específico, como MySQL, PostgreSQL ou SQLite, os comandos podem ser ajustados conforme a sintaxe específica do sistema. Aqui está como você poderia definir as tabelas:

sql
Copiar código
-- Tabela Cliente
CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Tabela Vendedor
CREATE TABLE Vendedor (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Tabela Região
CREATE TABLE Regiao (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela Filial
CREATE TABLE Filial (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    id_regiao INT,
    endereco_tipo_logradouro VARCHAR(100),
    endereco_logradouro VARCHAR(100),
    endereco_numero VARCHAR(20),
    endereco_complemento VARCHAR(100),
    FOREIGN KEY (id_regiao) REFERENCES Regiao(id)
);

-- Tabela Vendas
CREATE TABLE Vendas (
    id_pedido INT PRIMARY KEY,
    data DATE,
    valor_venda DECIMAL(10, 2),
    id_vendedor INT,
    id_cliente INT,
    id_regiao INT,
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id),
    FOREIGN KEY (id_regiao) REFERENCES Regiao(id)
);
Explicação dos Comandos SQL:
Cliente: Cria a tabela Cliente com colunas id, nome e email. O id é a chave primária.

Vendedor: Cria a tabela Vendedor com colunas id, nome e email. O id é a chave primária.

Região: Cria a tabela Regiao com colunas id e nome. O id é a chave primária.

Filial: Cria a tabela Filial com colunas id, nome, id_regiao, endereco_tipo_logradouro, endereco_logradouro, endereco_numero e endereco_complemento. O id é a chave primária. id_regiao é uma chave estrangeira que referencia Regiao(id).

Vendas: Cria a tabela Vendas com colunas id_pedido, data, valor_venda, id_vendedor, id_cliente e id_regiao. id_pedido é a chave primária. id_vendedor, id_cliente e id_regiao são chaves estrangeiras que referenciam Vendedor(id), Cliente(id) e Regiao(id), respectivamente.


Pergunta: Dado o modelo criado simule com pelo menos 10 registros.

-- Inserir dados na tabela Cliente
INSERT INTO Cliente (id, nome, email) VALUES
(1, 'João Silva', 'joao.silva@example.com'),
(2, 'Maria Oliveira', 'maria.oliveira@example.com'),
(3, 'Pedro Santos', 'pedro.santos@example.com'),
(4, 'Ana Costa', 'ana.costa@example.com'),
(5, 'Carlos Pereira', 'carlos.pereira@example.com');

-- Inserir dados na tabela Vendedor
INSERT INTO Vendedor (id, nome, email) VALUES
(1, 'Fernanda Souza', 'fernanda.souza@example.com'),
(2, 'Ricardo Mendes', 'ricardo.mendes@example.com'),
(3, 'Juliana Santos', 'juliana.santos@example.com'),
(4, 'Marcos Oliveira', 'marcos.oliveira@example.com'),
(5, 'Carla Lima', 'carla.lima@example.com');

-- Inserir dados na tabela Regiao
INSERT INTO Regiao (id, nome) VALUES
(1, 'Sudeste'),
(2, 'Nordeste'),
(3, 'Norte'),
(4, 'Centro-Oeste'),
(5, 'Sul');

-- Inserir dados na tabela Filial
INSERT INTO Filial (id, nome, id_regiao, endereco_tipo_logradouro, endereco_logradouro, endereco_numero, endereco_complemento) VALUES
(1, 'Filial Sudeste 1', 1, 'Rua', 'São Paulo', '100', 'Sala 101'),
(2, 'Filial Nordeste 1', 2, 'Avenida', 'Recife', '200', 'Andar 2'),
(3, 'Filial Norte 1', 3, 'Rua', 'Manaus', '300', 'Loja 3'),
(4, 'Filial Centro-Oeste 1', 4, 'Avenida', 'Brasília', '400', 'Loja 4'),
(5, 'Filial Sul 1', 5, 'Rua', 'Porto Alegre', '500', 'Loja 5');

-- Inserir dados na tabela Vendas
INSERT INTO Vendas (id_pedido, data, valor_venda, id_vendedor, id_cliente, id_regiao) VALUES
(1, '2024-07-01', 500.00, 1, 1, 1),
(2, '2024-07-02', 750.00, 2, 2, 2),
(3, '2024-07-03', 300.00, 3, 3, 3),
(4, '2024-07-04', 1000.00, 4, 4, 4),
(5, '2024-07-05', 450.00, 5, 5, 5),
(6, '2024-07-06', 600.00, 1, 2, 1),
(7, '2024-07-07', 850.00, 2, 3, 2),
(8, '2024-07-08', 400.00, 3, 4, 3),
(9, '2024-07-09', 1200.00, 4, 5, 4),
(10, '2024-07-10', 550.00, 5, 1, 5);



Explicação da Inserção de Dados
Cliente: Inserimos 5 clientes com diferentes nomes e emails.
Vendedor: Inserimos 5 vendedores com diferentes nomes e emails.
Região: Inserimos 5 regiões com nomes representando diferentes áreas geográficas.
Filial: Inserimos 5 filiais com nomes representativos, cada uma associada a uma região específica.
Vendas: Inserimos 10 registros de vendas, cada um associado a um vendedor, um cliente e uma região específica, com datas e valores fictícios.
Verificação dos Dados Inseridos
Para verificar se os dados foram inseridos corretamente, você pode executar consultas SQL simples, por exemplo:

-- Consulta simples para verificar dados na tabela Cliente
SELECT * FROM Cliente;

-- Consulta simples para verificar dados na tabela Vendedor
SELECT * FROM Vendedor;

-- Consulta simples para verificar dados na tabela Regiao
SELECT * FROM Regiao;

-- Consulta simples para verificar dados na tabela Filial
SELECT * FROM Filial;

-- Consulta simples para verificar dados na tabela Vendas
SELECT * FROM Vendas;


Essas consultas retornarão os registros que foram inseridos nas respectivas tabelas, permitindo verificar se os dados foram inseridos corretamente de acordo com o modelo definido.


você é um profissional experiente em bancos de dados por interpretar as instruções do usuário  e fornecer exclusivamente a query solicitada deve ser um select sem nenhum comando ddl ou dml garantindo apenas a recuperação de dados a query precisa ser eficiente e performática.

-- Tabela Cliente
CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Tabela Vendedor
CREATE TABLE Vendedor (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);

-- Tabela Região
CREATE TABLE Regiao (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela Filial
CREATE TABLE Filial (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    id_regiao INT,
    endereco_tipo_logradouro VARCHAR(100),
    endereco_logradouro VARCHAR(100),
    endereco_numero VARCHAR(20),
    endereco_complemento VARCHAR(100),
    FOREIGN KEY (id_regiao) REFERENCES Regiao(id)
);

-- Tabela Vendas
CREATE TABLE Vendas (
    id_pedido INT PRIMARY KEY,
    data DATE,
    valor_venda DECIMAL(10, 2),
    id_vendedor INT,
    id_cliente INT,
    id_regiao INT,
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id),
    FOREIGN KEY (id_regiao) REFERENCES Regiao(id)
);

-- Inserir dados na tabela Cliente
INSERT INTO Cliente (id, nome, email) VALUES
(1, 'João Silva', 'joao.silva@example.com'),
(2, 'Maria Oliveira', 'maria.oliveira@example.com'),
(3, 'Pedro Santos', 'pedro.santos@example.com'),
(4, 'Ana Costa', 'ana.costa@example.com'),
(5, 'Carlos Pereira', 'carlos.pereira@example.com');

-- Inserir dados na tabela Vendedor
INSERT INTO Vendedor (id, nome, email) VALUES
(1, 'Fernanda Souza', 'fernanda.souza@example.com'),
(2, 'Ricardo Mendes', 'ricardo.mendes@example.com'),
(3, 'Juliana Santos', 'juliana.santos@example.com'),
(4, 'Marcos Oliveira', 'marcos.oliveira@example.com'),
(5, 'Carla Lima', 'carla.lima@example.com');

-- Inserir dados na tabela Regiao
INSERT INTO Regiao (id, nome) VALUES
(1, 'Sudeste'),
(2, 'Nordeste'),
(3, 'Norte'),
(4, 'Centro-Oeste'),
(5, 'Sul');

-- Inserir dados na tabela Filial
INSERT INTO Filial (id, nome, id_regiao, endereco_tipo_logradouro, endereco_logradouro, endereco_numero, endereco_complemento) VALUES
(1, 'Filial Sudeste 1', 1, 'Rua', 'São Paulo', '100', 'Sala 101'),
(2, 'Filial Nordeste 1', 2, 'Avenida', 'Recife', '200', 'Andar 2'),
(3, 'Filial Norte 1', 3, 'Rua', 'Manaus', '300', 'Loja 3'),
(4, 'Filial Centro-Oeste 1', 4, 'Avenida', 'Brasília', '400', 'Loja 4'),
(5, 'Filial Sul 1', 5, 'Rua', 'Porto Alegre', '500', 'Loja 5');

-- Inserir dados na tabela Vendas
INSERT INTO Vendas (id_pedido, data, valor_venda, id_vendedor, id_cliente, id_regiao) VALUES
(1, '2024-07-01', 500.00, 1, 1, 1),
(2, '2024-07-02', 750.00, 2, 2, 2),
(3, '2024-07-03', 300.00, 3, 3, 3),
(4, '2024-07-04', 1000.00, 4, 4, 4),
(5, '2024-07-05', 450.00, 5, 5, 5),
(6, '2024-07-06', 600.00, 1, 2, 1),
(7, '2024-07-07', 850.00, 2, 3, 2),
(8, '2024-07-08', 400.00, 3, 4, 3),
(9, '2024-07-09', 1200.00, 4, 5, 4),    
(10, '2024-07-10', 550.00, 5, 1, 5);ln -sf /usr/local/bin/python


create or replace PACKAGE BODY CN_MDM_UTL_PK AS

  GC_SCOPE_PREFIX  CONSTANT VARCHAR2(100) := 'cn.mdm.'||LOWER($$plsql_unit) || '.';

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
PROCEDURE sync_changed_items (p_last_sync_time VARCHAR2) IS

  CURSOR cr_changed_items (cp_items_json IN CLOB) IS
    SELECT jt.*
    FROM   JSON_TABLE(cp_items_json, '$.items[*]'
            COLUMNS  (item_id              NUMBER         PATH '$.item_id',
                      item_number          VARCHAR2(50)   PATH '$.item_number',
                      item_description     VARCHAR2(4000) PATH '$.item_description',
                      uom_code             VARCHAR2(10)   PATH '$.uom_code',
                      order_enabled        VARCHAR2(1)    PATH '$.order_enabled',
                      purchase_enabled     VARCHAR2(1)    PATH '$.purchase_enabled',
                      status_code          VARCHAR2(10)   PATH '$.status_code',
                      lead_time_days       NUMBER         PATH '$.lead_time_days',
                      on_hand_quantity     NUMBER         PATH '$.on_hand_quantity',
                      date_introduced      TIMESTAMP WITH TIME ZONE PATH '$.date_introduced',
                      last_updated_utc     TIMESTAMP WITH TIME ZONE PATH '$.last_updated_utc')) jt;

  lt_parm_names        apex_application_global.VC_ARR2;
  lt_parm_values       apex_application_global.VC_ARR2;
  l_last_sync_time_utc TIMESTAMP WITH TIME ZONE;
  l_params_json        CLOB;
  l_items_clob         CLOB;
  l_base_url           VARCHAR2(500);
  l_item_exists        PLS_INTEGER;
  rest_call_failed     EXCEPTION;

BEGIN

  apex_automation.log_info('** Start **');
  apex_automation.log_info('p_last_sync_time: ' || p_last_sync_time);

  -- Fetch the Base URL for the Web Service from a remote server definiton
  --  stored at the workspace level. This avoids hard coding the URL of the REST API.
  SELECT base_url INTO l_base_url
  FROM   apex_workspace_remote_servers
  WHERE  remote_server_static_id = 'demo_cloudnueva_com_ords_demo';

  -- Store the Date and Time the Automation last run in the UTC Time zone.
  l_last_sync_time_utc := SYS_EXTRACT_UTC(TO_TIMESTAMP_TZ
                           (p_last_sync_time, 'YYYY-MM-DD"T"HH24:MI:SS.FF3TZH:TZM'));

  -- Prepare the HTTP Headers for the REST API Call.
  apex_web_service.g_request_headers.DELETE();
  apex_web_service.g_request_headers(1).NAME  := 'Content-Type';
  apex_web_service.g_request_headers(1).VALUE := 'application/json';

  -- Build JSON used to pass the last changed date to the REST API on the Remote Server.
  --  In this example, the remote REST API is an ORDS Service, so we are using 
  --  ORDS query syntax that produces a query string like this:
  --  q={"last_updated_utc":{"$gt":{"$date":"2023-12-03T19:56:44Z"}}}
  apex_json.initialize_clob_output();
  apex_json.open_object ();
  apex_json.open_object ('last_updated_utc');
  apex_json.open_object ('$gt');
  apex_json.write('$date', TO_CHAR(l_last_sync_time_utc, 'YYYY-MM-DD"T"HH24:MI:SS"Z"'));
  apex_json.close_all;
  l_params_json := apex_json.get_clob_output;
  apex_json.free_output;

  -- Prepare the Query String Parameters for the REST API Call.
  lt_parm_names.DELETE;
  lt_parm_names(1)  := 'q';
  lt_parm_values(1) := l_params_json;

  -- Call the REST API.
  l_items_clob := apex_web_service.make_rest_request
    (p_url                  => l_base_url || 'mdm/items',
     p_http_method          => 'GET',
     p_transfer_timeout     => 10,
     p_parm_name            => lt_parm_names,
     p_parm_value           => lt_parm_values,
     p_credential_static_id => 'credentials_for_mdm_items',
     p_token_url            => l_base_url || 'oauth/token');
  apex_automation.log_info('Status: ' || apex_web_service.g_status_code);

  IF apex_web_service.g_status_code = 201 THEN
    -- Loop through the changed items returned from the REST API.
    FOR r_item IN cr_changed_items (cp_items_json => l_items_clob) LOOP
      -- Check if the item already exists in the local table.
      SELECT COUNT(1) INTO l_item_exists
      FROM   mdm_items_local
      WHERE  item_id = r_item.item_id;

      IF l_item_exists = 0 THEN
        -- Create the item in the local table.
        apex_automation.log_info(' > Adding Item: ' || r_item.item_number);
        INSERT INTO mdm_items_local 
         (item_id, item_number, item_description,
          uom_code, order_enabled, purchase_enabled,
          status_code, lead_time_days, on_hand_quantity,
          date_introduced, last_updated_utc)
        VALUES 
         (r_item.item_id, r_item.item_number, r_item.item_description,
          r_item.uom_code, r_item.order_enabled, r_item.purchase_enabled,
          r_item.status_code, r_item.lead_time_days, r_item.on_hand_quantity,
          r_item.date_introduced, r_item.last_updated_utc);
      ELSE
        apex_automation.log_info(' > Updating Item: ' || r_item.item_number);
        -- Update the item in the local table.
        UPDATE mdm_items_local
        SET    item_number      = r_item.item_number
        ,      item_description = r_item.item_description
        ,      uom_code         = r_item.uom_code
        ,      order_enabled    = r_item.order_enabled
        ,      purchase_enabled = r_item.purchase_enabled
        ,      status_code      = r_item.status_code
        ,      lead_time_days   = r_item.lead_time_days
        ,      on_hand_quantity = r_item.on_hand_quantity
        ,      date_introduced  = r_item.date_introduced
        ,      last_updated_utc = r_item.last_updated_utc
        WHERE  item_id = r_item.item_id;
      END IF;
    END LOOP;

  ELSE
    raise rest_call_failed;
  END IF;

EXCEPTION WHEN rest_call_failed THEN
  apex_automation.log_error('Call to REST API failed');
  RAISE;
WHEN OTHERS THEN
  apex_automation.log_error('Unhandled Error ['||SQLERRM||']');
  RAISE;
END sync_changed_items;

END CN_MDM_UTL_PK;
/

create or replace PACKAGE BODY CN_MDM_UTL_PK AS

  GC_SCOPE_PREFIX  CONSTANT VARCHAR2(100) := 'cn.mdm.'||LOWER($$plsql_unit) || '.';

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
PROCEDURE sync_changed_items (p_last_sync_time VARCHAR2) IS

  CURSOR cr_changed_items (cp_items_json IN CLOB) IS
    SELECT jt.*
    FROM   JSON_TABLE(cp_items_json, '$.items[*]'
            COLUMNS  (item_id              NUMBER         PATH '$.item_id',
                      item_number          VARCHAR2(50)   PATH '$.item_number',
                      item_description     VARCHAR2(4000) PATH '$.item_description',
                      uom_code             VARCHAR2(10)   PATH '$.uom_code',
                      order_enabled        VARCHAR2(1)    PATH '$.order_enabled',
                      purchase_enabled     VARCHAR2(1)    PATH '$.purchase_enabled',
                      status_code          VARCHAR2(10)   PATH '$.status_code',
                      lead_time_days       NUMBER         PATH '$.lead_time_days',
                      on_hand_quantity     NUMBER         PATH '$.on_hand_quantity',
                      date_introduced      TIMESTAMP WITH TIME ZONE PATH '$.date_introduced',
                      last_updated_utc     TIMESTAMP WITH TIME ZONE PATH '$.last_updated_utc')) jt;

  lt_parm_names        apex_application_global.VC_ARR2;
  lt_parm_values       apex_application_global.VC_ARR2;
  l_last_sync_time_utc TIMESTAMP WITH TIME ZONE;
  l_params_json        CLOB;
  l_items_clob         CLOB;
  l_base_url           VARCHAR2(500);
  l_item_exists        PLS_INTEGER;
  rest_call_failed     EXCEPTION;

BEGIN

  apex_automation.log_info('** Start **');
  apex_automation.log_info('p_last_sync_time: ' || p_last_sync_time);

  -- Fetch the Base URL for the Web Service from a remote server definiton
  --  stored at the workspace level. This avoids hard coding the URL of the REST API.
  SELECT base_url INTO l_base_url
  FROM   apex_workspace_remote_servers
  WHERE  remote_server_static_id = 'demo_cloudnueva_com_ords_demo';

  -- Store the Date and Time the Automation last run in the UTC Time zone.
  l_last_sync_time_utc := SYS_EXTRACT_UTC(TO_TIMESTAMP_TZ
                           (p_last_sync_time, 'YYYY-MM-DD"T"HH24:MI:SS.FF3TZH:TZM'));

  -- Prepare the HTTP Headers for the REST API Call.
  apex_web_service.g_request_headers.DELETE();
  apex_web_service.g_request_headers(1).NAME  := 'Content-Type';
  apex_web_service.g_request_headers(1).VALUE := 'application/json';

  -- Build JSON used to pass the last changed date to the REST API on the Remote Server.
  --  In this example, the remote REST API is an ORDS Service, so we are using 
  --  ORDS query syntax that produces a query string like this:
  --  q={"last_updated_utc":{"$gt":{"$date":"2023-12-03T19:56:44Z"}}}
  apex_json.initialize_clob_output();
  apex_json.open_object ();
  apex_json.open_object ('last_updated_utc');
  apex_json.open_object ('$gt');
  apex_json.write('$date', TO_CHAR(l_last_sync_time_utc, 'YYYY-MM-DD"T"HH24:MI:SS"Z"'));
  apex_json.close_all;
  l_params_json := apex_json.get_clob_output;
  apex_json.free_output;

  -- Prepare the Query String Parameters for the REST API Call.
  lt_parm_names.DELETE;
  lt_parm_names(1)  := 'q';
  lt_parm_values(1) := l_params_json;

  -- Call the REST API.
  l_items_clob := apex_web_service.make_rest_request
    (p_url                  => l_base_url || 'mdm/items',
     p_http_method          => 'GET',
     p_transfer_timeout     => 10,
     p_parm_name            => lt_parm_names,
     p_parm_value           => lt_parm_values,
     p_credential_static_id => 'credentials_for_mdm_items',
     p_token_url            => l_base_url || 'oauth/token');
  apex_automation.log_info('Status: ' || apex_web_service.g_status_code);

  IF apex_web_service.g_status_code = 201 THEN
    -- Loop through the changed items returned from the REST API.
    FOR r_item IN cr_changed_items (cp_items_json => l_items_clob) LOOP
      -- Check if the item already exists in the local table.
      SELECT COUNT(1) INTO l_item_exists
      FROM   mdm_items_local
      WHERE  item_id = r_item.item_id;

      IF l_item_exists = 0 THEN
        -- Create the item in the local table.
        apex_automation.log_info(' > Adding Item: ' || r_item.item_number);
        INSERT INTO mdm_items_local 
         (item_id, item_number, item_description,
          uom_code, order_enabled, purchase_enabled,
          status_code, lead_time_days, on_hand_quantity,
          date_introduced, last_updated_utc)
        VALUES 
         (r_item.item_id, r_item.item_number, r_item.item_description,
          r_item.uom_code, r_item.order_enabled, r_item.purchase_enabled,
          r_item.status_code, r_item.lead_time_days, r_item.on_hand_quantity,
          r_item.date_introduced, r_item.last_updated_utc);
      ELSE
        apex_automation.log_info(' > Updating Item: ' || r_item.item_number);
        -- Update the item in the local table.
        UPDATE mdm_items_local
        SET    item_number      = r_item.item_number
        ,      item_description = r_item.item_description
        ,      uom_code         = r_item.uom_code
        ,      order_enabled    = r_item.order_enabled
        ,      purchase_enabled = r_item.purchase_enabled
        ,      status_code      = r_item.status_code
        ,      lead_time_days   = r_item.lead_time_days
        ,      on_hand_quantity = r_item.on_hand_quantity
        ,      date_introduced  = r_item.date_introduced
        ,      last_updated_utc = r_item.last_updated_utc
        WHERE  item_id = r_item.item_id;
      END IF;
    END LOOP;

  ELSE
    raise rest_call_failed;
  END IF;

EXCEPTION WHEN rest_call_failed THEN
  apex_automation.log_error('Call to REST API failed');
  RAISE;
WHEN OTHERS THEN
  apex_automation.log_error('Unhandled Error ['||SQLERRM||']');
  RAISE;
END sync_changed_items;

END CN_MDM_UTL_PK;
/
BEGIN
  -- Truncate the Table before loading.
  EXECUTE IMMEDIATE 'TRUNCATE TABLE EV_SALES_BY_YEAR';
  -- Fetch the File from OCI, Unzip it, Parse it and Load It.
  INSERT INTO EV_SALES_BY_YEAR (DATA_YEAR,COUNTY,FUEL_TYPE,MAKE,MODEL,NUMBER_OF_VEHICLES)
  SELECT col001  data_year
  ,      col002  COUNTY
  ,      col003  FUEL_TYPE
  ,      col004  MAKE
  ,      col005  MODEL
  ,      col006  NUMBER_OF_VEHICLES
  FROM   apex_data_parser.parse
           (p_content => apex_zip.get_file_content 
                          (p_zipped_blob => dbms_cloud.get_object
                                             (credential_name => 'obj_store_dbms_cloud_test',
                                              object_uri      => 'https://objectstorage.us-ashburn-1.oraclecloud.com/n/xxxxx/b/dbms_cloud_test/o/CA_EV_Sales.csv.zip'),
                          p_file_name    => 'CA_EV_Sales.csv'),
            p_skip_rows => 1,
            p_detect_data_types => 'N',
            p_file_name => 'CA_EV_Sales.csv');

END;


DECLARE
  l_operation_id  user_load_operations.id%TYPE;
BEGIN
  -- Truncate the table prior to load.
  EXECUTE IMMEDIATE 'TRUNCATE TABLE EV_SALES_BY_YEAR';
  -- Stream, Parse and Load the File.
  dbms_cloud.copy_data
    -- Table we want to load data into.
   (table_name      => 'EV_SALES_BY_YEAR',
    -- Credential we created above using dbms_cloud.create_credential
    credential_name => 'obj_store_dbms_cloud_test',
    -- CSV List of fields from the CSV file, 
    --   listed in the same order as columns in the table.
    -- The field names do not have to match the column names.
    -- It is a good idea to specify field sizes for VARCHAR2 columns
    --  as I have done here. Otherwise, dbms_cloud.copy_data 
    --  assumes a default of only 240 characters.
    field_list      => 'data_year,county CHAR(50),fuel_type CHAR(50),make CHAR(50),model CHAR(50),number_of_vehicles',    
    -- File name, CSV List of Files, or Wildcard Expression
    --  representing the file(s) to load.
    file_uri_list   => 'https://objectstorage.us-ashburn-1.oraclecloud.com/n/xxxx/b/dbms_cloud_test/o/CA_EV_Sales.gzip',
    -- Variable returned by dbms_cloud.copy_data with 
    --  the ID of the load. Track Progess of the load by 
    -- querying user_load_operations WHERE id = l_operation_id
    operation_id    => l_operation_id,
    -- JSON_OBJECT containing details required to perform the load.
    --   type: CSV File, coompression: File is compressed by gzip
    format          => json_object ('type'                 value  'csv',
                                    'compression'          value  'gzip',
                                    'skipheaders'          value  '1',
                                    'delimiter'            value  ',',
                                    'ignoremissingcolumns' value 'true' ));
END;


SELECT id
,      status
,      logfile_table
,      badfile_table
,      rows_loaded
FROM   user_load_operations
WHERE  id = 48;


SELECT id
,      status
,      logfile_table
,      badfile_table
,      rows_loaded
FROM   user_load_operations
WHERE  id = 48;


DECLARE
  lt_parm_names      apex_application_global.VC_ARR2; 
  lt_parm_values     apex_application_global.VC_ARR2; 
BEGIN
  lt_parm_names(1)  := 'lat'; 
  lt_parm_values(1) := '32.866889'; 
  lt_parm_names(2)  := 'lng'; 
  lt_parm_values(2) := '-117.257139'; 
  lt_parm_names(3)  := 'date'; 
  lt_parm_values(3) := 'today'; 
  lt_parm_names(4)  := 'formatted'; 
  lt_parm_values(4) := '0'; 
END;


-- Example ACL to allow the schema APEX_230200 
--   connect access to any host '*'
BEGIN
    DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
        host => '*',
        ace => xs$ace_type(privilege_list => xs$name_list('connect'),
                           principal_name => 'APEX_230200',
                           principal_type => xs_acl.ptype_db));
END;


curl -H "Time-Zone: America/Sao_Paulo" -X POST https://api.github.com/repos/github-linguist/linguist/contents/new_file.md

https://apibldr.com/

https://blog.cloudnueva.com/rad-stack-integrations-part1

Elas incluem Oracle Integration Cloud (OIC), Mulesoft, Jitterbit e Dell Boomi. 
Essas soluções oferecem conectores pré-construídos, mapeamento de dados, orquestração, 
gerenciamento de API, vários protocolos de transporte, recursos de tratamento de erros,
 etc. Esses recursos, no entanto, não vêm sem um custo significativo. O custo está relacionado às 
 taxas de assinatura mensal e à contratação de engenheiros altamente pagos para construir e 
 manter suas integrações.

Padrões comuns de integração
* Obtendo dados de outros sistemas
* Recebendo dados de outros sistemas
* Enviando dados para outros sistemas

O caso de uso se concentra em um sistema Master Data Management (MDM) 
Armazena um total de 10.000 itens.
Possui serviços REST protegidos usando credenciais de cliente OAuth2.
Tem uma API GET REST para buscar itens, que retorna JSON. O serviço suporta paginação, permitindo até 500 itens por página.

As seções a seguir descrevem três abordagens para lidar com esse cenário.

Em tempo real via fonte de dados REST
Sincronizar com uma tabela local usando fonte de dados REST
Sincronizar alterações em uma tabela local usando uma automação APEX e código PL/SQL
apex_rest_source_sync_log (Tabela de Log)


Within the APEX SQL Workshop screen execute the following PLSQL







BEGIN
    OAUTH.CREATE_CLIENT(
        P_NAME => 'sql_dev_client',
        P_GRANT_TYPE => 'client_credentials',
        P_OWNER => 'HR',
        P_DESCRIPTION => 'OAuth Client With SQL Developer role',
        P_ORIGINS_ALLOWED => '',
        P_REDIRECT_URI => NULL,
        P_SUPPORT_EMAIL => 'test@example.com',
        P_SUPPORT_URI => 'https://example.com',
        P_PRIVILEGE_NAMES => ''
    );
    OAUTH.GRANT_CLIENT_ROLE(
        P_CLIENT_NAME => 'sql_dev_client',
        P_ROLE_NAME => 'SQL Developer'
    );
    COMMIT;
END;
SELECT name, client_id, client_secret FROM user_ords_clients;

curl \
--user 3WjIAi.:myb-nWh.. \
--data 'grant_type=client_credentials' \
https://my-database.adb.eu-frankfurt-1.oraclecloudapps.com/ords/<schema alias>/oauth/token

{
 "access_token":"9EVGMlgDLQ8N5clLKVLj0Q",
 "token_type":"bearer",
 "expires_in":3600


 curl 'https://my-database.adb.eu-frankfurt-1.oraclecloudapps.com/ords/hr/_/db-api/stable/database/datapump/jobs/' \
  -H 'Authorization: bearer 9EVGMlgDLQ8N5clLKVLj0Q'


  curl 'https://my-database.adb.eu-frankfurt-1.oraclecloudapps.com/ords/hr/_/sql' \
  -H 'Authorization: bearer 9EVGMlgDLQ8N5clLKVLj0Q' \
  -H 'Content-Type: application/json' \
  --data-raw '{"statementText":"select user from dual","offset":0,"limit":256}'


  BEGIN
    ords.enable_object(p_object => 'TEAM', p_auto_rest_auth => TRUE);
    ords.enable_object(p_object => 'DRIVER', p_auto_rest_auth => TRUE);
    ords.enable_object(p_object => 'RACE', p_auto_rest_auth => TRUE);
    ords.enable_object(p_object => 'DRIVER_RACE_MAP', p_auto_rest_auth => TRUE);
    ords.enable_object(p_object => 'RACE_DV', p_object_type => 'VIEW', p_auto_rest_auth => TRUE);
 
    ords.enable_object(p_object => 'DRIVER_DV', p_object_type => 'VIEW', p_auto_rest_auth => TRUE);
 
    ords.enable_object(p_object => 'TEAM_DV', p_object_type => 'VIEW', p_auto_rest_auth => TRUE);
 
    oauth.delete_client(p_name => 'Car Racing Client');
    oauth.create_client(p_name => 'Car Racing Client', 
                    p_grant_type => 'client_credentials', 
                    p_description => 'Used for interacting with Car Racing Duality View Examples', 
                    p_owner => sys_context( 'userenv', 'current_schema' ),
                    p_support_email => 'janus@example.com', 
                    p_privilege_names => null);
  OAUTH.grant_client_role(
    p_client_name => 'Car Racing Client',
    p_role_name   => 'oracle.dbtools.role.autorest.HR.TEAM'
  );
 
  OAUTH.grant_client_role(
    p_client_name => 'Car Racing Client',
    p_role_name   => 'oracle.dbtools.role.autorest.HR.DRIVER'
  );
  OAUTH.grant_client_role(
    p_client_name => 'Car Racing Client',
    p_role_name   => 'oracle.dbtools.role.autorest.HR.RACE'
  );
  OAUTH.grant_client_role(
    p_client_name => 'Car Racing Client',
    p_role_name   => 'oracle.dbtools.role.autorest.HR.DRIVER_RACE_MAP'
  );
  OAUTH.grant_client_role(
    p_client_name => 'Car Racing Client',
    p_role_name   => 'oracle.dbtools.role.autorest.HR.RACE_DV'
  );
  OAUTH.grant_client_role(
    p_client_name => 'Car Racing Client',
    p_role_name   => 'oracle.dbtools.role.autorest.HR.DRIVER_DV'
  );
  OAUTH.grant_client_role(
    p_client_name => 'Car Racing Client',
    p_role_name   => 'oracle.dbtools.role.autorest.HR.TEAM_DV'
  );
 
    COMMIT;
END;
/


SELECT client_id, client_secret 
FROM user_ords_clients 
WHERE name = 'Car Racing Client';


curl -X 'GET' \
  'http://localhost:8080/ords/hr/driver_dv/' \
  -H 'accept: application/json'


  curl \
--user x9mADG7hKJNlj4LNITBJ3Q..:alRNwbRmezM2E0YDPTe6eA.. \
--data 'grant_type=client_credentials' \
http://localhost:8080/ords/hr/oauth/token
 
{
 "access_token":"Fs5Lrsu1g6XAP1mGXMnUig",
 "token_type":"bearer",
 "expires_in":3600
}


curl -X 'GET' \
  'http://localhost:8080/ords/hr/driver_dv/' \
  -H 'accept: application/json' \
  -H 'Authorization: Bearer Vu1AJ02QdF_13_kjjsSXRw'



2
3
4
curl -i -X POST --data-binary @add-team.json \
  -H "Content-Type: application/json" \
  -H 'Authorization: Bearer Vu1AJ02QdF_13_kjjsSXRw' \
  'http://localhost:8080/ords/hr/team_dv/batchload



  url --request POST \
  --url http://localhost:8080/ords/hr/driver_race_map/ \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer Vu1AJ02QdF_13_kjjsSXRw' \
  --data '{"race_id"   : 202, "driver_id" : 119, "position" : 4}'
 
curl --request POST \
  --url http://localhost:8080/ords/hr/driver_race_map/ \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer Vu1AJ02QdF_13_kjjsSXRw' \
  --data '{"race_id"   : 202, "driver_id" : 115, "position" : 3}'
 
curl --request POST \
  --url http://localhost:8080/ords/hr/driver_race_map/ \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer Vu1AJ02QdF_13_kjjsSXRw' \
  --data '{"race_id"   : 202, "driver_id" : 103, "position" : 2}'
 
curl --request POST \
  --url http://localhost:8080/ords/hr/driver_race_map/ \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer Vu1AJ02QdF_13_kjjsSXRw' \
  --data '{"race_id"   : 202, "driver_id" : 101, "position" :


curl --location 'http://localhost:8080/ords/hr/_/graphql' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer vSs7J_ILrcynMaPWyVcQLA' \
--data '{"query":"query Drivers {\n  driver \n  { \n    driver_id \n    name \n    points \n    team_id\n    team_team_id {\n        name\n    }\n    driver_race_map_driver_id {\n        driver_race_map_id\n        race_id\n        race_race_id {\n            name\n            race_date\n        }\n        position\n    }\n  }\n}","variables":{}}'


Extrado Detalhado da previdencia


```
docker create -it --name 23cfree -p 8521:1521 -p 8500:5500 -p 8023:8080 -p 9043:8443 -p 9922:22 -e ORACLE_PWD=E container-registry.oracle.com/database/free:latest
curl -o unattended_apex_install_23c.sh https://raw.githubusercontent.com/Pretius/pretius-23cfree-unattended-apex-installer/main/src/unattended_apex_install_23c.sh
curl -o 00_start_apex_ords_installer.sh https://raw.githubusercontent.com/Pretius/pretius-23cfree-unattended-apex-installer/main/src/00_start_apex_ords_installer.sh
docker cp unattended_apex_install_23c.sh 23cfree:/home/oracle
docker cp 00_start_apex_ords_installer.sh 23cfree:/opt/oracle/scripts/startup
docker start 23cfree
docker exec -it 23cfree /bin/bash tail -f /home/oracle/unattended_apex_install_23c.log
 http://localhost:8023/ords/apex
     User: ADMIN
    Password: OrclAPEX1999!

ORDS_PUBLIC_USER, APEX_PUBLIC_USER, SYS, etc. Password: E

docker pull container-registry.oracle.com/database/free:latest
docker run -d -it --name 23cfree -p 8521:1521 -p 8500:5500 -p 8023:8080 -p 9043:8443 -p 9922:22 -e ORACLE_PWD=oracle container-registry.oracle.com/database/free:latest
docker exec -it 23cfree /bin/bash
curl -o apex-latest.zip https://download.oracle.com/otn_software/apex/apex-latest.zip
unzip apex-latest.zip
rm apex-latest.zip
cd apex
sqlplus / as sysdba
ALTER SESSION SET CONTAINER = FREEPDB1;
@apexins.sql SYSAUX SYSAUX TEMP /i/
ALTER USER APEX_PUBLIC_USER IDENTIFIED BY oracle ACCOUNT UNLOCK;
@apxchpwd.sql
exit
mkdir /home/oracle/software
mkdir /home/oracle/software/apex
mkdir /home/oracle/software/ords
mkdir /home/oracle/scripts
cp -r /home/oracle/apex/images /home/oracle/software/apex
su
dnf update -y
dnf install sudo -y
dnf install nano -y

nano /etc/sudoers
dnf install java-17-openjdk -y
java -version
mkdir /etc/ords
mkdir /etc/ords/config
mkdir /home/oracle/logs
chmod -R 777 /etc/ords
yum-config-manager --add-repo=http://yum.oracle.com/repo/OracleLinux/OL8/oracle/software/x86_64
dnf install ords -y
export _JAVA_OPTIONS="-Xms512M -Xmx512M"
ords --config /etc/ords/config install

# Follow the configuration steps
Installation Type > Choose option [2] Enter
Connection Type > Choose option [1] Enter
host name > Enter
listen port > Enter
service name > FREEPDB1
administrator username > SYS
password > oracle
default tablespace > Enter
temp tablespace > Enter
features > Enter
Start ORDS > [1] Enter <-- Standalone Mode
protocol > [1] < http
port > [1] <-- 8080
Static Resources > /home/oracle/software/apex/images

limactl start
brew install lima
limactl start
lima nerdctl run -d --name nginx -p 127.0.0.1:8080:80 nginx:alpine
docker build -t nerdctl .
docker run -it --rm --privileged nerdctl
docker run -d -p 1521:1521 -e ORACLE_PASSWORD=<your password> -v oracle-volume:/opt/oracle/oradata gvenzl/oracle-free
colima start --arch x86_64 --memory 4
colima start --arch x86_64 --memory 4
docker create -it --name 23cfree -p 8521:1521 -p 8500:5500 -p 8023:8080 -p 9043:8443 -p 9922:22 -e ORACLE_PWD=E container-registry.oracle.com/database/free:latest
curl -o unattended_apex_install_23c.sh https://raw.githubusercontent.com/Pretius/pretius-23cfree-unattended-apex-installer/main/src/unattended_apex_install_23c.sh
curl -o 00_start_apex_ords_installer.sh https://raw.githubusercontent.com/Pretius/pretius-23cfree-unattended-apex-installer/main/src/00_start_apex_ords_installer.sh
docker cp unattended_apex_install_23c.sh 23cfree:/home/oracle
docker cp 00_start_apex_ords_installer.sh 23cfree:/opt/oracle/scripts/startup
docker start 23cfree

docker exec -it 23cfree /bin/bash
 tail -f /home/oracle/unattended_apex_install_23c.log

http://localhost:8023/ords/apex
User: ADMIN
Password: OrclAPEX1999!
netstat -tunlp
netstat -tnlp | grep :22
```

## Manual

```
docker pull container-registry.oracle.com/database/free:latest
docker run -d -it --name 23cfree -p 8521:1521 -p 8500:5500 -p 8023:8080 -p 9043:8443 -e ORACLE_PWD=E container-registry.oracle.com/database/free:latest

docker exec -it 23cfree /bin/bash
curl -o apex-latest.zip https://download.oracle.com/otn_software/apex/apex-latest.zip

unzip apex-latest.zip
rm apex-latest.zip
cd apex


bash-4.4$ sqlplus / as sysdba
SQL*Plus: Release 23.0.0.0.0 - Developer-Release on Wed Apr 5 13:27:32 2023 Version 23.2.0.0.0
Copyright (c) 1982, 2023, Oracle. All rights reserved.
Connected to: Oracle Database 23c Free, Release 23.0.0.0.0 - Developer-Release Version 23.2.0.0.0


ALTER SESSION SET CONTAINER = FREEPDB1;
@apexins.sql SYSAUX SYSAUX TEMP /i/

ALTER USER APEX_PUBLIC_USER ACCOUNT UNLOCK;
ALTER USER APEX_PUBLIC_USER IDENTIFIED BY E;

@apxchpwd.sql

exit


mkdir /home/oracle/software
mkdir /home/oracle/software/apex
mkdir /home/oracle/software/ords
mkdir /home/oracle/scripts

cp -r /home/oracle/apex/images /home/oracle/software/apex
cd /home/oracle/
su
cat /dev/null > /etc/dnf/vars/ociregion
dnf update -y
dnf install sudo -y
dnf install nano -y
nano /etc/sudoers
Defaults !lecture
oracle ALL=(ALL) NOPASSWD: ALL
dnf install java-17-openjdk -y

mkdir /etc/ords
mkdir /etc/ords/config
mkdir /home/oracle/logs
chmod -R 777 /etc/ords
java -version

openjdk version "17.0.6" 2023-01-17 LTS
OpenJDK Runtime Environment (Red_Hat-17.0.6.0.10-3.el8_7) (build 17.0.6+10-LTS)
OpenJDK 64-Bit Server VM (Red_Hat-17.0.6.0.10-3.el8_7) (build 17.0.6+10-LTS, mixed mode, sharing)

yum-config-manager --add-repo=http://yum.oracle.com/repo/OracleLinux/OL8/oracle/software/x86_64
dnf install ords -y

export _JAVA_OPTIONS="-Xms512M -Xmx512M"
ords --config /etc/ords/config install


Enter a number to select the TNS net service name to use or specify the database connection
   [1] EXTPROC_CONNECTION_DATA SID=PLSExtProc
   [2] FREE         SERVICE_NAME=FREE
   [3] FREEPDB1     SERVICE_NAME=FREEPDB1
   [S] Specify the database connection
 Choose [1]: 3
Provide database user name with administrator privileges.
  Enter the administrator username: SYS
Enter the database password for SYS AS SYSDBA: E
Retrieving information.
ORDS is not installed in the database. ORDS installation is required.
  Enter a number to update the value or select option A to Accept and Continue
    [1] Connection Type: TNS
    [2] TNS Connection: TNS_NAME=FREEPDB1 TNS_FOLDER=/opt/oracle/product/23c/dbhomeFree/network/admin
           Administrator User: SYS AS SYSDBA
    [3] Database password for ORDS runtime user (ORDS_PUBLIC_USER): <generate>
    [4] ORDS runtime user and schema tablespaces:  Default: SYSAUX Temporary TEMP
    [5] Additional Feature: Database Actions
    [6] Configure and start ORDS in Standalone Mode: Yes
    [7]    Protocol: HTTP
    [8]       HTTP Port: 8080
    [9]   APEX static resources location:
    [A] Accept and Continue - Create configuration and Install ORDS in the database
    [Q] Quit - Do not proceed. No changes
  Choose [A]:


/home/oracle/software/apex/images


<code class="lang-plaintext">2024-04-15T15:30:27.922Z INFO        Oracle REST Data Services initialized
Oracle REST Data Services version : 24.1.0.r0960841
Oracle REST Data Services server info: jetty/10.0.20
Oracle REST Data Services java info: OpenJDK 64-Bit Server VM 17.0.10+7-LTS

docker pull container-registry.oracle.com/database/express:latest
docker images
docker network create apex-network
docker run -d --name apex_db --hostname apexhost --network=apex-network -p 1522:1521 container-registry.oracle.com/database/express:latest
docker exec -it apex_db sqlplus / as sysdba
show pdbs
docker exec apex_db ./setPassword.sh hamza123
docker logs apex_db
sqlplus sys/hamza123@//apexhost:1522/XE as sysdba
sqlplus system/hamza123@//apexhost:1522/XE
sqlplus pdbadmin/hamza123@//apexhost:1522/XEPDB1

docker pull container-registry.oracle.com/database/ords:latest
mkdir ~/apex
echo CONN_STRING=sys/hamza123@apexhost:1521/XEPDB1 > ~/apex/conn_string.txt
docker inspect apex_db
and search for the IPAddress
CONN_STRING=user/password@host:port/service_name
docker run --rm --name apex -v /absolute_path/apex:/opt/oracle/variables --network=apex-network -p 8181:8181 container-registry.oracle.com/database/ords:latest
sqlplus sys/hamza123@//apexhost:1521/XEPDB1 as sysdba

and set the password

alter user APEX_PUBLIC_USER identified by eraoui123;
Workspace: internal
Username: admin
Password: Welcome_1
```
-----

https://container-registry.oracle.com/ords/f?p=113:4:125263294212830:::4:P4_REPOSITORY,AI_REPOSITORY,AI_REPOSITORY_NAME,P4_REPOSITORY_NAME,P4_EULA_ID,P4_BUSINESS_AREA_ID:2483,2483,Oracle%20REST%20Data%20Services%20(ORDS)%20Developer,Oracle%20REST%20Data%20Services%20(ORDS)%20Developer,1,0&cs=3g8WqCdCHnTwO_vdTDFZOuXnGHFJqGmTSq33H6KzH5Dgj3yYtLVwukRbKmQNswoBJJ1pgGi8tdDfqEWX4QI99hw
https://container-registry.oracle.com/ords/f?p=113:1:125263294212830::::P1_BUSINESS_AREA:3&cs=3SzFK-vQSoyxp-VJsLJ5i3TX8lMX_KbVUc3GJ092IsL_X1nUA0z7vnNHR-qbd32xd6mdEOTV3D2WAxIVAPkt38A
http://localhost:8023/ords/apex i
https://pretius.com/blog/oracle-apex-docker-ords/

--------------

```
FROM oraclelinux:7.9

MAINTAINER Daniel Hochleitner <dhochleitner@posteo.de>

# environment variables
ENV INSTALL_APEX=true \
    INSTALL_SQLCL=true \
    INSTALL_SQLDEVWEB=true \
    INSTALL_LOGGER=true \
    INSTALL_OOSUTILS=true \
    INSTALL_AOP=true \
    INSTALL_AME=true \
    INSTALL_SWAGGER=true \
    INSTALL_CA_CERTS_WALLET=true \
    DBCA_TOTAL_MEMORY=2048 \
    ORACLE_SID=orcl \
    SERVICE_NAME=orcl \
    DB_INSTALL_VERSION=19 \
    ORACLE_BASE=/u01/app/oracle \
    ORACLE_HOME12=/u01/app/oracle/product/12.2.0.1/dbhome \
    ORACLE_HOME18=/u01/app/oracle/product/18.0.0/dbhome \
    ORACLE_HOME19=/u01/app/oracle/product/19.0.0/dbhome \
    ORACLE_INVENTORY=/u01/app/oraInventory \
    PASS=oracle \
    ORDS_HOME=/u01/ords \
    JAVA_HOME=/opt/java \
    TOMCAT_HOME=/opt/tomcat \
    APEX_PASS=OrclAPEX1999! \
    APEX_ADDITIONAL_LANG= \
    APEX_PATCH_SET_BUNDLE_FILE= \
    TIME_ZONE=UTC

# copy all scripts
ADD scripts /scripts/

# copy all files
ADD files /files/

# image setup via shell script to reduce layers and optimize final disk usage
RUN /scripts/install_main.sh

# ssh, database and apex port
EXPOSE 22 1521 8080

# use ${ORACLE_BASE} without product subdirectory as data volume
VOLUME ["${ORACLE_BASE}"]

# entrypoint for database creation, startup and graceful shutdown
ENTRYPOINT ["/scripts/entrypoint.sh"]
```


-- entrypoint.sh

#!/bin/bash

# set environment
. /scripts/setenv.sh

# add hostname
echo "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4" > /etc/hosts
echo "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6" >> /etc/hosts
echo "127.0.0.1   $HOSTNAME" >> /etc/hosts

# set timezone
ln -s -f /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

# start all components
# ssh
/usr/sbin/sshd
# oracle
if [ ${DB_INSTALL_VERSION} == "12" ]; then
    export ORACLE_HOME=${ORACLE_HOME12}
fi
if [ ${DB_INSTALL_VERSION} == "18" ]; then
    export ORACLE_HOME=${ORACLE_HOME18}
fi
if [ ${DB_INSTALL_VERSION} == "19" ]; then
    export ORACLE_HOME=${ORACLE_HOME19}
fi
gosu oracle bash -c "${ORACLE_HOME}/bin/lsnrctl start"
gosu oracle bash -c 'echo startup\; | ${ORACLE_HOME}/bin/sqlplus -s -l / as sysdba'
# tomcat
if [ ${INSTALL_APEX} == "true" ]; then
    gosu tomcat bash -c "${TOMCAT_HOME}/bin/startup.sh"
fi

# Infinite wait loop, trap interrupt/terminate signal for graceful termination
trap "gosu oracle bash -c 'echo shutdown immediate\; | ${ORACLE_HOME}/bin/sqlplus -S / as sysdba'" INT TERM
while true; do sleep 1; done
;;
```