# APIs
Uma API é um conjunto de protocolos, rotinas e ferramentas para criar aplicativos de software. Ele especifica como os componentes de software devem interagir.

## Tipos de API:
  - [x] APIs públicas: abertas para uso por desenvolvedores externos (por exemplo, API do Twitter)
  - [x] APIs privadas: usadas internamente em uma organização
  - [x] APIs de parceiros: compartilhadas com parceiros de negócios específicos
  - [x] APIs compostas: combine várias APIs de dados ou serviços

## Estilos de API
Os estilos de arquitetura definem como diferentes componentes de uma interface de programação de aplicativos (API) interagem uns com os outros. Como resultado, eles garantem eficiência, confiabilidade e facilidade de integração com outros sistemas, fornecendo uma abordagem padrão para projetar e criar APIs. Aqui estão os estilos mais usados:

- [x] SOAP (Simple Object Access Protocol): Um protocolo para troca de dados estruturados. Maduro, abrangente, baseado em XML.
- [x] RESTful (Representational State Transfer): um estilo de arquitetura amplamente usado para APIs da Web. Métodos HTTP populares e fáceis de implementar, sendo ideal para serviços da web.
- [x] GraphQL: uma linguagem de consulta para APIs que permite que os clientes solicitem dados específicos.
- [x] gRPC: uma estrutura de código aberto de alto desempenho desenvolvida pelo Google. Buffers de protocolo modernos e de alto desempenho, adequado para arquiteturas de microsserviços.
- [x] WebSockets: Permite a comunicação full-duplex em tempo real entre o cliente e o servidor.Conexões persistentes, bidirecionais e em tempo real. Perfeito para troca de dados de baixa latência.
- [x] Webhook: Permite notificações em tempo real e arquitetura orientada a eventos. Retornos de chamada HTTP orientados por eventos, assíncronos. Notifica os sistemas quando ocorrem eventos.

![](img/modelo-de-api.png)

##  Segurança da API

- [x] Autenticação: Básica, OAuth 2.0, JSON Web Tokens (JWT)
- [x] Autorização: Controlando direitos de acesso a recursos
- [x] Limitação de taxa: Prevenção de abusos limitando o número de solicitações
- [x] Criptografia: Protegendo dados em trânsito usando HTTPS

## Práticas recomendadas de design de API

- [x] Convenções RESTful: Usando métodos HTTP corretamente, nomenclatura adequada de recursos
- [x] Controle de versão: controle de versão de URI (por exemplo, /v1/users), controle de versão de parâmetro de consulta (por exemplo, /users?version=1), controle de versão de cabeçalho (por exemplo, Aceitar: application/vnd.company.v1+json).
- [x] Paginação: Manipulação eficiente de grandes conjuntos de dados
- [x] Tratamento de erros: uso adequado de códigos de status HTTP e mensagens de erro informativas

## Documentação da API

- [x] Especificação Swagger/OpenAPI: Um padrão para descrever APIs RESTful
- [x] Postman: Uma ferramenta popular para desenvolvimento e documentação de API
- [x] ReDoc: Uma ferramenta para gerar uma bela documentação de API

## Teste de API

- [x] Postman: Permite criar e executar testes de API
- [x] SoapUI: Uma ferramenta para testar APIs SOAP e REST
- [x] JMeter: Usado para testes de desempenho e carga
- [x] API Mocking: Ferramentas como Mockoon ou servidores simulados do Postman para simular respostas de API

## Gerenciamento de API

- [x] Gateways de API: Azure API Management, AWS API Gateway, Kongk, Apigee.
- [x] Gerenciamento do ciclo de vida: coleções de carteiros, RapidAPI, Akan.
- [x] Análise e monitoramento de API: Moesif. Datadog, pilha ELK (Elasticsearch, Logstash, Kibana)

## Regras
- [x] no 1: Use substantivos plurais para coleções:É uma convenção arbitrária, mas está bem estabelecida e eu descobri que as violações tendem a ser um indicador principal de "esta API terá arestas".
```
GET /products              # get all the products
GET /products/{product_id} # get one product
```
- [x] no 2: Não adicione segmentos de caminho desnecessários
```
# GOOD
GET /v3/application/listings/{listing_id}
```
- [x] no 3: Não adicione .json ou outras extensões à url

# API Security Checklist

Lista das mais importantes medidas de segurança para o desenvolvimento, teste e publicação da sua API.

---

## Autenticação (_Authentication_)

- [x] Não use `Basic Auth`. Use padrões de autenticação (exemplo: JWT, OAuth).
- [x] Não reinvente a roda nos quesitos `Autenticação`, `geração de tokens` e `armazenamento de senhas`. Use os padrões recomendados para cada caso.
- [x] Implemente funcionalidades de limite (_`Max Retry`_) e bloqueio de tentativas de autenticação.
- [x] Use criptografia em todos os dados confidenciais.

### JWT (JSON Web Token)

- [x] Use uma chave de segurança aleatória e complicada (`JWT Secret`) para tornar ataques de força bruta menos eficientes.
- [x] Não utilize o algoritmo de criptografia informado no cabeçalho do payload. Force o uso de um algoritmo específico no _back-end_ (`HS256` ou `RS256`).
- [x] Defina o tempo de vida do _token_ (`TTL`, `RTTL`) o menor possível.
- [x] Não armazene informações confidenciais no JWT, pois elas podem ser [facilmente decodificadas](https://jwt.io/#debugger-io).
- [x] Evite armazenar muitos dados. JWT geralmente é compartilhado em headers e eles têm um limite de tamanho.

## Acesso (_Access_)

- [x] Limite a quantidade de requisições (_Throttling_) para evitar ataques DDoS e de força bruta.
- [x] Use HTTPS no seu servidor para evitar ataques MITM (_Man In The Middle Attack_).
- [x] Use cabeçalho `HSTS` com SSL para evitar ataques _SSL Strip_.
- [x] Desative as listagens de diretórios.
- [x] Para APIs privadas, permita o acesso apenas de IPs/hosts da lista branca (whitelist).

## Autorização (_Authorization_)

### OAuth

- [x] Sempre valide o `redirect_uri` no seu servidor através de uma lista de URLs conhecidas (previamente cadastradas).
- [x] Tente sempre retornar códigos de negociação, não o _token_ de acesso (não permita `response_type=token`).
- [x] Utilize o parâmetro `state` com um _hash_ aleatório para previnir CSRF no processo de autenticação OAuth.
- [x] Defina escopo de dados, e valide o parâmetro `scope` para cada aplicação.

## Requisição (_Input_)

- [x] Utilize o método HTTP apropriado para cada operação, `GET (obter)`, `POST (criar)`, `PUT/PATCH (trocar/atualizar)` e `DELETE (apagar)`.
- [x] Valide o tipo de conteúdo informado no cabeçalho `Accept` da requisição (_Content Negotiation_) para permitir apenas os formatos suportados pela sua API (ex. `application/xml`, `application/json` ... etc), respondendo com o status `406 Not Acceptable` se ele não for suportado.
- [x] Valide o tipo de conteúdo do conteúdo da requisição informado no cabeçalho `Content-Type` da requisição para permitir apenas os formatos suportados pela sua API (ex. `application/x-www-form-urlencoded`, `multipart/form-data, application/json` ... etc).
- [x] Valide o conteúdo da requisição para evitar as vulnerabilidades mais comuns (ex. `XSS`, `SQL-Injection`, `Remote Code Execution` ... etc).
- [x] Não utilize nenhuma informação sensível (credenciais, senhas, _tokens_ de autenticação) na URL. Use o cabeçalho `Authorization` da requisição.
- [x] Use apenas criptografia do lado do servidor.
- [x] Use um serviço _gateway_ para a sua API para habilitar _cache_, limitar acessos sucessivos (ex. por quantidade máxima permitida (_Quota_), por limitar tráfego em situações de estresse (_spike arrest_) ou por limitar o número de conexões simultâneas na sua API (_Concurrent Rate Limit_)), e facilitar o _deploy_ de novas funcionalidades.

## Processamento (_Processing_)

- [x] Verifique continuamente os _endpoints_ protegidos por autenticação para evitar falhas na proteção de acesso aos dados.
- [x] Não utilize a identificação do próprio usuário. Use `/me/orders` no lugar de `/user/654321/orders`.
- [x] Não utilize ID's incrementais. Use UUID.
- [x] Se você estiver processando arquivos XML, verifique que _entity parsing_ não está ativada para evitar ataques de XML externo (XXE - _XML external entity attack_).
- [x] Se você estiver processando arquivos XML, verifique que _entity expansion_ não está ativada para evitar _Billion Laughs/XML bomb_ através de ataques exponenciais de expansão de XML.
- [x] Use CDN para _uploads_ de arquivos.
- [x] Se você estiver trabalhando com uma grande quantidade de dados, use _workers_ e _queues_ (fila de processos) para retornar uma resposta rapidamente e evitar o bloqueio de requisições HTTP.
- [x] Não se esqueça de desativar o modo de depuração (_DEBUG mode OFF_).
- [x] Use stacks não executáveis quando disponíveis.

## Resposta (_Output_)

- [x] Envie o cabeçalho `X-Content-Type-Options: nosniff`.
- [x] Envie o cabeçalho `X-Frame-Options: deny`.
- [x] Envie o cabeçalho `Content-Security-Policy: default-src 'none'`.
- [x] Remova os cabeçalhos de identificação dos _softwares_ do servidor - `X-Powered-By`, `Server`, `X-AspNet-Version`.
- [x] Envie um cabeçalho `Content-Type` na sua resposta com o valor apropriado (ex. se você retorna um JSON, então envie um `Content-Type: application/json`).
- [x] Não retorne dados sensíveis como senhas, credenciais e tokens de autenticação.
- [x] Utilize o código de resposta apropriado para cada operação. Ex. `200 OK` (respondido com sucesso), `201 Created` (novo recurso criado), `400 Bad Request` (requisição inválida), `401 Unauthorized` (não autenticado), `405 Method Not Allowed` (método HTTP não permitido) ... etc.

## CI & CD

- [x] Monitore a especificação e implementação do escopo da sua API através de testes unitários e de integração.
- [x] Use um processo de revisão de código, ignorando sistemas de auto-aprovação.
- [x] Certifique-se de que todos os componentes de seus serviços sejam validados por _softwares_ AV (anti-vírus, anti-_malware_) antes de enviar para produção, incluindo as dependências de terceiros utilizadas.
- [x] Execute continuamente testes de segurança (análise estática/dinâmica) em seu código.
- [x] Verifique suas dependências (software e sistema operacional) para vulnerabilidades conhecidas.
- [x] Implemente funcionalidade de reversão de _deploy_ (_rollback_).

## Monitoramento (_Monitoring_)

- [x] Use logins centralizados para todos os serviços e componentes.
- [x] Use agentes para monitorar todo o tráfego, erros, solicitações, e respostas.
- [x] Use alertas para SMS, Slack, Email, Telegram, Kibana, Cloudwatch, etc.
- [x] Verifique se você não está registrando dados confidenciais, como cartões de crédito, senhas, PINs, etc.
- [x] Use um sistema IDS e/ou IPS para monitorar as solicitações e instâncias de sua API.

## API Specification Languages
- [OpenAPI (formerly known as Swagger)](https://github.com/OAI/OpenAPI-Specification)
- [API Blueprint](https://github.com/apiaryio/api-blueprint)
- [JSON Schema](http://json-schema.org/)
- [RAML](https://raml.org/)

## API Specification Tools
- [Swagger Inspector](https://swagger.io/tools/swagger-inspector/): Test and auto-generate OpenAPI documentation for any API.
- [Swagger Editor](http://editor.swagger.io/): An editor for designing Swagger specifications.
- [Swagger Tools and Integrations](https://swagger.io/open-source-integrations/): A list of libraries and frameworks serving the Swagger ecosystem.
- [OpenAPI extension for VS Code](https://marketplace.visualstudio.com/items?itemName=42Crunch.vscode-openapi):  Visual Studio Code (VS Code) extension that provides support for the OpenAPI Specification.
- [OpenAPI plugin for JetBrains IDEs](https://plugins.jetbrains.com/plugin/14837-openapi-swagger-editor): Jetbrains plugin that provides support for the OpenAPI Specification.
- [Dredd](https://github.com/apiaryio/dredd): Validate API documentation written in API Blueprint against its backend implementation.
- [API Spec Converter](https://lucybot-inc.github.io/api-spec-converter/): Convert between different API spec formats.
- [Apimatic](https://www.apimatic.io/): Supports API description formats including Swagger, OAI format, RAML, API Blueprint, IO Docs, WADL, Postman Collections and HAR 1.4 and more
- [OpenAPI Definition Designer](https://openapidesigner.com): Free visual OpenAPI3 definition creation and editing tool.
- [Stoplight Studio](https://stoplight.io/studio/): Create, prototype, and share OpenAPI descriptions and JSON Schemas using a visual editor.
- [Spectral](https://github.com/stoplightio/spectral): Define rulesets to lint YAML or JSON, including OpenAPI 2.x, 3.x and AsyncAPI
- [Optic](https://www.useoptic.com/docs/openapi/generate-from-traffic): Verify the accuracy of your OpenAPI 3.x spec using real traffic, and automatically apply patches that keep it up-to-date
- [RateMyOpenAPI](https://ratemyopenapi.com/): Open-source tools that scans your OpenAPI spec and identifies issues with documentation, security, and SDK generation - and generates a report with fix suggestions.
- [OpenAPI DevTools](https://github.com/AndrewWalsh/openapi-devtools): Browser extension that generates API specs for any app or website

## API Specifications
- [API Commons](http://apicommons.org/): A repository of language-agnostic API specifications / Data Models.
- [APIS.guru](https://apis.guru/openapi-directory/): Directory of API specs in OpenAPI(aka Swagger) 2.0 format.
- [AnyAPI](https://any-api.com/): Documentation and Test Consoles for Public APIs.

## API Frameworks

### Ruby
- [rails-api](https://github.com/rails-api/rails-api): Rails for API only applications.
- [pliny](https://github.com/interagent/pliny): Opinionated template Sinatra app for writing APIs in Ruby.
- [grape](https://github.com/ruby-grape/grape): An opinionated micro-framework for creating REST-like APIs in Ruby.
- [ActiveModel::Serializer](https://github.com/rails-api/active_model_serializers): Brings convention over configuration to your JSON generation.
- [rabl](https://github.com/nesquena/rabl): Generate JSON and XML from any ruby object.
- [jbuilder](https://github.com/rails/jbuilder): Create JSON structures via a Builder-style DSL.
- [roar](https://github.com/trailblazer/roar): Parse and render REST API documents using representers.

### Python
- [Django REST framework](http://www.django-rest-framework.org/): Toolkit that makes it easy to build Web APIs.
- [Tastypie](https://github.com/django-tastypie/django-tastypie): Webservice API framework for Django.
- [restless](https://github.com/toastdriven/restless): A lightweight REST miniframework for Python.
- [flask-restful](https://github.com/flask-restful/flask-restful): Simple framework for creating REST APIs.
- [Falcon](https://github.com/falconry/falcon): Falcon is a low-level, high-performance Python framework for building HTTP APIs, app backends, and higher-level frameworks.
- [Connexion](https://github.com/zalando/connexion): Swagger/OpenAPI First framework for Python on top of Flask with automatic endpoint validation and OAuth2 support
- [apistar](https://github.com/encode/apistar): A smart Web API framework, designed for Python3.
- [sanic](https://github.com/channelcat/sanic): Sanic is a Flask-like Python 3.5+ web server that's written to go fast.
- [hug](https://github.com/timothycrosley/hug): hug aims to make developing Python driven APIs as simple as possible, but no simpler.
- [FastAPI](https://github.com/tiangolo/fastapi): FastAPI is a modern, fast (high-performance), web framework for building APIs with Python 3.6+ based on standard Python type hints.

### Javascript
- [hapi.js](https://hapijs.com/): Web and services application framework for Node.js.
- [Restify](https://github.com/restify/node-restify): Node.js REST framework specifically meant for web service APIs.
- [Express](https://expressjs.com/): Fast, unopinionated, minimalist web framework for Node.js.
- [sailsjs](http://sailsjs.org/): Realtime MVC Framework for Node.js.
- [Actionhero](https://www.actionherojs.com/): Multi-transport Node.js API server with integrated cluster capabilities and delayed tasks.
- [Baucis](https://github.com/wprl/baucis): To build
- [Koa](http://koajs.com/): Next generation web framework for Node.js
- [Loopback](http://loopback.io/): Node.js framework for creating APIs and easily connecting to backend data sources.
- [Seneca](http://senecajs.org/): A microservices toolkit for Node.js.
- [Feathers](https://feathersjs.com/): Build RESTful and real-time APIs through Socket.io or Primus.
- [Deployd](https://github.com/deployd/deployd): Deployd is the simplest way to build realtime APIs for web and mobile apps
- [Nest](https://github.com/kamilmysliwiec/nest): A modern node.js framework for efficient and scalable web applications built on top of TypeScript

### Go
- [Go-Json-Rest](https://github.com/ant0ine/go-json-rest): Thin layer on top of `net/http` that helps building RESTful APIs easily
- [gocrud](https://github.com/manishrjain/gocrud): Go library to simplify creating, updating and deleting arbitrary depth structured data — to make building REST services fast and easy.
- [sleepy](https://github.com/dougblack/sleepy): RESTful micro-framework written in Go.
- [restit](https://github.com/go-restit/restit): Go micro framework to help writing RESTful API integration test.
- [go-relax](https://github.com/codehack/go-relax): Framework of pluggable components to build RESTful API's.
- [go-rest](https://github.com/ungerik/go-rest): Small and evil REST framework for Go.
- [go-restful](https://github.com/emicklei/go-restful): A declarative highly readable framework for building restful API's.
- [Goat](https://github.com/bahlo/goat): Minimalistic REST API server in Go.
- [Resoursea](https://github.com/resoursea/api): REST framework for quickly writing resource based services.
- [Zerver](https://github.com/cosiner/zerver): Zerver is a expressive, modular, feature completed RESTful framework.
- [Fiber](https://github.com/gofiber/fiber): :zap:Fiber is an Express inspired web framework written in Go with :coffee: .

### Scala
- [Colossus](https://github.com/tumblr/colossus): I/O and microservice library for Scala.
- [Finatra](https://twitter.github.io/finatra/): Fast, testable, Scala HTTP services built on Twitter-Server and Finagle.
- [Play](https://www.playframework.com/): The high velocity web framework for Java and Scala.
- [Scalatra](http://www.scalatra.org/): Simple, accessible and free web micro-framework.
- [Skinny Micro](https://github.com/skinny-framework/skinny-micro): Micro-web framework to build servlet applications in Scala.
- [Spray](http://spray.io/): Open-source toolkit for building REST/HTTP-based integration layers on top of Scala and Akka.
- [Akka HTTP](https://github.com/akka/akka-http): The Akka HTTP modules implement a full server- and client-side HTTP stack on top of akka-actor and akka-stream.
- [Swagger Akka HTTP](https://github.com/swagger-akka-http/swagger-akka-http): Swagger-Akka-Http brings Swagger support for Akka-Http Apis.

### Java
- [Rest.li](http://rest.li/): REST framework using type-safe bindings and asynchronous, non-blocking IO.
- [Dropwizard](https://www.dropwizard.io/en/latest/): Framework for developing ops-friendly, high-performance, RESTful web services.
- [Jersey](https://jersey.java.net/): RESTful web services in Java.
- [Spring Boot](https://projects.spring.io/spring-boot/): RESTful Web Service using Spring, high-performance and little configuration needed.
- [Metamug Mason](https://github.com/metamug/mason): Create REST APIs with JSP tags and SQL. Edit and hot deploy REST resources on the server.

### Haskell
- [Scotty](https://github.com/scotty-web/scotty): Micro web framework inspired by Ruby's Sinatra, using WAI and Warp.
- [Spock](https://github.com/agrafix/Spock): Another Haskell web framework for rapid development.
- [Servant](https://github.com/haskell-servant/servant): A Type-Level Web DSL.
- [Yesod](https://github.com/yesodweb/yesod): The Haskell RESTful web framework.

### Elixir
- [Phoenix](http://phoenixframework.org/): Framework for building HTML5 apps, API backends and distributed systems.
- [Plug](https://github.com/elixir-plug/plug): A specification and conveniences for composable modules between web applications.

### Erlang
- [Cowboy](https://github.com/ninenines/cowboy): Small, fast, modular HTTP server written in Erlang.
- [Gen Microservice](https://github.com/videlalvaro/gen_microservice): This library solves the problem of implementing microservices with Erlang.
- [Mochiweb](https://github.com/mochi/mochiweb): Erlang library for building lightweight HTTP servers.

### Postgres
- [PostgREST](https://github.com/begriffs/postgrest): Serve a RESTful API from any existing PostgreSQL database.
- [pREST](https://github.com/prest/prest): pREST is a way to serve a RESTful API from any databases written in Go.

### MySQL
- [xmysql](https://github.com/o1lab/xmysql): Generate REST APIs for any MySQL Database.

### PHP
- [API Platform](https://github.com/api-platform/api-platform): API framework on top of Symfony with JSON-LD, Schema.org and Hydra support
- [Dingo API](https://github.com/dingo/api): A RESTful API package for the Laravel and Lumen frameworks
- [Fractal](https://github.com/thephpleague/fractal): Fractal provides a presentation and transformation layer for complex data output, the like found in RESTful APIs, and works really well with JSON
- [Yii2 Framework](https://github.com/yiisoft/yii2): Provides a whole set of tools to simplify the task of implementing RESTful Web Service APIs

### R
- [Plumber](https://www.rplumber.io/): API Framework to build APIs for simple R Functions

### C#
- [ASP.NET Web APIs](https://dotnet.microsoft.com/en-us/apps/aspnet/apis): Build secure REST APIs on any platform with C#

### Miscellaneous
- [Dream Factory](https://github.com/dreamfactorysoftware/dreamfactory): Turn any database into an API platform.

## API Client Development Tools

### General
- [Swagger CodeGen](https://github.com/swagger-api/swagger-codegen): Generate client libraries automatically from a Swagger-compliant server.
- [AutoRest](https://github.com/Azure/autorest): Generate client libraries for RESTful web services
- [OpenAPI Generator](https://github.com/openapitools/openapi-generator): A community fork of Swagger Codegen to automatically generate API clients, server stubs and documentation for REST APIs given an OpenAPI/Swagger spec.

### Ruby
- [Net::HTTP](https://apidock.com/ruby/Net/HTTP): An HTTP client API for Ruby.
- [faraday](https://github.com/lostisland/faraday): Simple, but flexible HTTP client library, with support for multiple backends.
- [rest-client](https://github.com/rest-client/rest-client): Simple HTTP and REST client for Ruby
- [heroics](https://github.com/interagent/heroics): Ruby HTTP client for APIs represented with JSON schema.
- [blanket](https://github.com/inf0rmer/blanket): A Ruby API wrapper.
- [nestful](https://github.com/maccman/nestful): Ruby HTTP/REST client.

### Java
- [Retrofit](https://square.github.io/retrofit/): A type-safe HTTP client for Android and Java.

### Javascript
- [Restangular](https://github.com/mgonto/restangular): Restangular is an AngularJS service that simplifies common GET, POST, DELETE, and UPDATE requests with a minimum of client code

### .NET
- [Refit](https://github.com/paulcbetts/refit): The automatic type-safe REST library for .NET Core, Xamarin and .NET
- [WebAnchor](https://github.com/mattiasnordqvist/Web-Anchor): Web Anchor provides type-safe, testable and flexible access to web resources.

### .Dart
- [Frog](https://dartfrog.vgv.dev/docs/overview): Dart Frog is built on top of shelf and mason and is inspired by many tools including remix.run, next.js, and express.js.
- [Serverpod](https://github.com/serverpod/serverpod): Serverpod is a next-generation app and web server, built for the Flutter community. It allows you to write your server-side code in Dart, automatically generate your APIs, and hook up your database with minimal effort. Serverpod is open-source, and you can host your server anywhere.


## API Documentation
- [ReDoc](https://github.com/Rebilly/ReDoc): OpenAPI/Swagger-generated API Reference Documentation.
- [Swagger UI](https://github.com/swagger-api/swagger-ui): Dynamically generate documentation from a Swagger-compliant API.
- [Slate](https://github.com/lord/slate): Static site generated documentation for your API.
- [DeveloperHub](https://developerhub.io/): Documentation tool to write, publish, review, analyse and collect feedback on personalised customer-facing API docs.
- [prmd](https://github.com/interagent/prmd): JSON Schema tooling: scaffold, verify, and generate documentation from JSON Schema documents.
- [Aglio](https://github.com/danielgtaylor/aglio): An API Blueprint renderer with theme support that outputs static HTML.
- [Apiary](https://apiary.io/): Collaborative design, instant API mock, generated documentation, integrated code samples, debugging and automated testing.
- [Readme](https://readme.io/): API Documentation Hosting.
- [API Docs](https://api-docs.io/): Hosted public API documentation for OAS (Swagger) and RAML specs.
- [Docbox](https://github.com/tmcw/docbox): REST API documentation generator, using Markdown.
- [widdershins](https://github.com/Mermade/widdershins): REST API documentation generator from OpenAPI 3.0 / Swagger 2.0 / AsyncAPI 1.x / Semoasa 0.1.0 definition
- [Elements](https://github.com/stoplightio/elements): Web Components-based API documentation for OpenAPI 3.x/2.x

## API Clients

### Open Source
- [Hoppscotch](https://github.com/hoppscotch/hoppscotch): API client for REST, GraphQL, Websocket, SSE, Socket.IO and MQTT
- [Hurl](https://github.com/Orange-OpenSource/hurl): Hurl makes it easy to work with HTML content, REST / SOAP / GraphQL APIs, or any other XML / JSON based APIs.
- [ATAC](https://github.com/Julien-cpsn/ATAC): A feature-full TUI API client made in Rust. ATAC is free, open-source, offline and account-less.

### Hosted
<div class="mdx-columns2" markdown>
- [JSON Generator](http://www.json-generator.com/): Generate and host mock JSON data.
</div>

### Desktop
<div class="mdx-columns2" markdown>
- [Postman](https://www.getpostman.com): Desktop API testing tool.
- [Firecamp](https://firecamp.app): API Studio for WebSocket, Rest API and GraphQL.
- [HTTPie](https://httpie.org/): Command line HTTP client.
- [Paw](https://paw.cloud/): REST client for Mac.
- [Insomnia](https://insomnia.rest/): REST API client for Mac, Windows, and Linux.
- [httpy](https://github.com/knid/httpy): Programmable Command line HTTP client.
</div>

## API Debugging and Mocking

### Hosted
<div class="mdx-columns2" markdown>
- [Beeceptor](https://beeceptor.com): An HTTP-proxy for rest APIs - inspect and build mock APIs.
- [MockBin](https://mockbin.com/): Generate mock HTTP endpoints.
- [httpbin](http://httpbin.org): Templated responses for testing various scenarios for HTTP requests.
- [Prism](https://github.com/stoplightio/prism): a set of packages for API mocking and contract testing with OpenAPI v2 (formerly known as Swagger) and OpenAPI v3.x, including mock servers and a validation proxy.
- [MockingCloud](https://mockingcloud.com): Generate full mock REST APIs with just OpenAPI yaml/json spec files.
- [Svix Play](https://www.svix.com/play/): Easily inspect, test, and debug incoming webhooks.
</div>

### Desktop
<div class="mdx-columns2" markdown>
- [Postman](https://www.getpostman.com/docs/postman/mock_servers/setting_up_mock): Desktop API client and mocking tool.
- [Json-Server](https://github.com/typicode/json-server) Full fake REST API with zero coding.
- [Mockoon](https://mockoon.com): Desktop API mocking tool.
</div>

## API Design Guides
<div class="mdx-columns2" markdown>
- [Google API Design Guide](https://cloud.google.com/apis/design/)
- [Heroku Platform HTTP API Design Guide](https://github.com/interagent/http-api-design)
- [Haufe API Style Guide](http://work.haufegroup.io/api-style-guide/)
- [Microsoft REST API Guidelines](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md)
- [18F API Standards](https://github.com/18f/api-standards)
- [The RESTed NARWHL](https://www.narwhl.com/)
- [White House Web API Standards](https://github.com/whitehouse/api-standards)
- [Zalando REST API Guidelines](https://zalando.github.io/restful-api-guidelines/)
- [API Stylebook Design Guidelines](http://apistylebook.com/design/guidelines/)
- [API Stylebook Design Topics](http://apistylebook.com/design/topics/)
- [Adidas-group API Design Guide](https://github.com/adidas-group/api-guidelines)
- [Azure API Design](https://docs.microsoft.com/en-us/azure/architecture/best-practices/api-design)
</div>

## API Publishing
<div class="mdx-columns2" markdown>
- [Mashape](https://www.mashape.com/): API Marketplace.
</div>

## API Gateways
<div class="mdx-columns2" markdown>
- [AWS API Gateway](https://aws.amazon.com/api-gateway/): Traffic management, authorization and access control, monitoring, and API version management.
- [Ambassador API Gateway](https://www.getambassador.io/): Ambassador is a specialized control plane that translates Kubernetes annotations to Envoy configuration. All traffic is directly handled by the high-performance Envoy Proxy.
- [APIGrove](https://apigrove.github.io/apigrove/): API manager built in Java on top of Fuse ESB.
- [Apigee127](https://github.com/apigee-127/a127-documentation/wiki/What-is-Apigee-127): nodejs based API Gateway
- [APISIX](https://apisix.apache.org/): Open Source and Cloud-Native API gateway, based on the Nginx library and etcd.
- [Pushpin](http://pushpin.org): Proxy for both request/response or streaming (long poll) of responses
- [Strongloop](https://github.com/strongloop/microgateway): nodejs based API Gateway
- [Fusio](http://www.fusio-project.org/): PHP based open source API management platform
- [Camel](https://camel.apache.org/): Empowers you to define routing and mediation rules in a variety of domain-specific languages, including a Java-based fluent API, Spring or Blueprint XML configuration files, and a Scala DSL.
- [HAProxy](http://www.haproxy.org/): Reliable, high Performance TCP/HTTP load balancer.
- [OpenResty](https://openresty.org/): Fast web application server built on top of Nginx.
- [Tengine](http://tengine.taobao.org/): A distribution of Nginx with some advanced features.
- [Tyk](https://tyk.io/): Open-source, fast and scalable API gateway, portal and API management platform.
- [Vulcand](https://github.com/vulcand/vulcand): Programmatic load balancer backed by Etcd.
- [Zuul](https://github.com/Netflix/zuul): An edge service that provides dynamic routing, monitoring, resiliency, security, and more.
- [Kong](https://getkong.org/): An open-source management layer for APIs, delivering high performance and reliability.
- [Janus](https://github.com/hellofresh/janus): A lightweight API Gateway written in Go by [Hello Fresh](https://engineering.hellofresh.com).
- [fabio](https://github.com/fabiolb/fabio): A fast, modern, zero-conf load balancing HTTP(S) router for deploying microservices managed by [consul](https://www.consul.io) by eBay.
- [Traefik](https://github.com/containous/traefik): Træfik (pronounced like traffic) is a modern HTTP reverse proxy and load balancer written in Go.
- [Oathkeeper](https://github.com/ory/oathkeeper): OIdentity & Access Proxy (IAP) that authorizes HTTP requests based on sets of rules. Integrates with ORY Hydra.
- [Zuplo](https://zuplo.com/): OpenAPI-Powered API Management platform for API Development, Deployment, and Documentation. Add auth, rate-limiting, and monetization to your API in minutes.
</div>

## API Security
<div class="mdx-columns2" markdown>
- [Online OpenAPI/Swagger File Security Audit](https://apisecurity.io/tools/audit/): Free online static analysis of API contract files. Upload the file and get the report.
- [API Security checklist](https://github.com/shieldfy/API-Security-Checklist): Checklist of the most important security countermeasures when designing, testing, and releasing your API.
- [Ory Hydra](https://github.com/ory/hydra): OAuth2 server with OpenID Connect written in Go.
</div>

## API Web Scanners
<div class="mdx-columns2" markdown>
- [Cherrybomb](https://github.com/blst-security/cherrybomb): Stop half-done API specifications! Cherrybomb is a CLI tool that helps you avoid undefined user behaviour by validating your API specifications.
</div>

## API Monitoring
<div class="mdx-columns2" markdown>
- [Runscope](https://www.runscope.com/): API Performance Monitoring.
- [Ping-API](https://ping-api.com/): Automated API Testing.
- [Streamdal](https://streamdal.com): A tool to embed privacy controls in your application code to detect PII as it enters and leaves your systems, preventing it from reaching unintended APIs, databases, data streams, or pipelines.
</div>

## API Testing
<div class="mdx-columns2" markdown>
- [Assertible](https://assertible.com): Continuously test and monitor your APIs after deployments and across environments.
- [Hurl](https://github.com/Orange-OpenSource/hurl): Hurl makes it easy to test HTML content, REST / SOAP / GraphQL APIs, or any other XML / JSON based APIs.
- [Pyresttest](https://github.com/svanoort/pyresttest): YAML based REST testing and API microbenchmarking tool
- [OWASP Zaproxy](https://github.com/zaproxy/zaproxy): A tool to test your API for known security vulnerabilities, with a great CI integration.
- [RestQA](https://github.com/restqa/restqa): Microservice API Testing tool focused on providing a great developer experience.
- [Optic CI](https://www.useoptic.com/docs/diff-openapi): Test for breaking API changes in CI Pipelines
</div>

## API Developer Portal
<div class="mdx-columns2" markdown>
- [Tyk](https://tyk.io/features): API Developer Portal on top of API gateway, make your API gateway easier to be used by developers.
- [APIMATIC](https://apimatic.io/developer-experience-portal): Instantly build an API Portal with SDKs, Live Code Samples, Test Cases, API Transformation and language specific Docs & Reference - tailored for your API.
- [Optic Docs](https://www.useoptic.com): Share verified-accurate OpenAPI documentation with your consumers. With Optic they can subscribe to your API and get notified when it changes.
- [Zuplo](https://zuplo.com/): OpenAPI-Powered API Management platform for API Development, Deployment, and Documentation. Zuplo's Developer Portal integrates key-management, usage analytics, and monetization for free.
</div>

## JSON Format Standards
<div class="mdx-columns2" markdown>
- [HAL](http://stateless.co/hal_specification.html)
- [JSONAPI](http://jsonapi.org/faq/)
- [JSON Schema](http://json-schema.org/)
- [Hydra](http://www.hydra-cg.com/)
- [Ion](https://github.com/ionwg/ion-doc)
- [JSON-LD](https://json-ld.org/)
</div>

## Learning Resources
<div class="mdx-columns2" markdown>
- [REST in Practice](http://shop.oreilly.com/product/9780596805838.do)
- [Roy Fielding's dissertation on REST](https://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm)
- [Best Practices for Designing a Pragmatic RESTful API](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api)
- [How to Design a REST API](https://blog.octo.com/en/design-a-rest-api/)
- [Automated API Development](https://yos.io/2016/04/27/automated-api-development/)
- [Nordic APIs](http://nordicapis.com/)
- [Undisturbed REST](https://www.mulesoft.com/sites/default/files/resource-assets/ebook-UndisturbedREST_v1.pdf)
- [Build APIs You Won't Hate](https://leanpub.com/build-apis-you-wont-hate)
- [Irresistible APIs](https://www.manning.com/books/irresistible-apis)
- [How to build an API](https://apiary.io/how-to-build-api)
- [API University](https://www.programmableweb.com/api-university)
- [RESTful Web Services](http://shop.oreilly.com/product/9780596529260.do)
- [RESTful Web APIs](http://shop.oreilly.com/product/0636920028468.do)
- [The Ten Essentials for Good API Documentation](https://alistapart.com/article/the-ten-essentials-for-good-api-documentation)
- [APIsecurity.io weekly newsletter](https://apisecurity.io)
- [Testing Web APIs](https://www.manning.com/books/testing-web-apis)
- [The Design of Web APIs, Second Edition](https://www.manning.com/books/the-design-of-web-apis-second-edition)
</div>

## Blogs
<div class="mdx-columns2" markdown>
- [API Evangelist](http://apievangelist.com/blog/)
</div>

## References
<div class="mdx-columns2" markdown>
- [HTTP Status Codes Reference](https://httpstatuses.com/)
</div>

## Contributing
<div class="mdx-columns2" markdown>
[Pull Requests](https://github.com/yosriady/api-development-tools/pulls) are most welcome!
</div>

Please write a brief one-sentence summary when adding a new resource.

## Thanks
**api-development-tools** © 2016+, Yos Riady. Released under the [MIT] License.<br>
Authored and maintained by Yos Riady with help from contributors ([list][contributors]).

- [yos.io](https://yos.io) &nbsp;&middot;&nbsp;
- GitHub [@yosriady](https://github.com/yosriady)
- [MIT]: https://mit-license.org/
- [contributors]: https://github.com/yosriady/api-development-tools/contributors
