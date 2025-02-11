okay let's resume where we left off in
our last tutorial we talked about three
commonly used design patterns in a
microservice architecture going over the
database per service the API Gateway and
the event driven design pattern today
we're going to expand this discussion by
diving into two more patterns the
service registry and Discovery pattern
and the circuit breaker one and we'll
conclude this tutorial by bringing all
five patterns together applying them to
our e-commerce solution if this sounds
good let's dive
Service Registry and Discovery
in let's talk about the service registry
and Discovery pattern which I should
qualify as plural because we have a few
options here but first this pattern aims
to solve the problem of dynamically
locating and communicating with services
in a distributed system its primary
purposes are to maintain an up-to-date
catalog of available service instances
enable automatic Service registration
into registration facilitate Dynamic
scaling and load balancing and last but
not least improv system resilience and
fault tolerance at a 50,000 ft view this
pattern involves two main components
first a service registry which can be
described as a database that stores
information about available service
instances including their Network
locations a service can either
self-register at startup or rely on a
third party that leverages the services
heartbeats the second component is a
service discovery which is the mechanism
by which a service can find the other
services it can interact with there are
two Discovery approaches here a client
side and a server side we'll talk about
both shortly let's however talk briefly
about the main challenges of this
pattern first we must ensure the
registry is always up toate limiting
temporary inconsistencies so that we can
avoid directing traffic to unavailable
instances then we need to consider
possible performance overhead frequent
registry queries can impact performance
Implement caching mechanisms to reduce
this overhead
of course the registry itself can become
a bottleneck and become a single point
of failure so please please please
Implement High availability and fault
tolerance for your registry then as
usual we have the problem of security
failing to secure the service registry
can expose sensitive information about
your infrastructure if you think about
it the registry is like a DNS and while
dns-based Discovery is simple it may not
be suitable for highly Dynamic
environments due to crashing and
propagation delays a common mistake with
this pattern is neglecting to implement
robust health checks within each
microservice as it can lead to routing
traffic to unhealthy instances last
failing to implement proper load
balancing strategies can result in
uneven distribution of traffic so you
want to avoid that too now let's see how
to implement this
Implementation
pattern and as you now understand there
are two components with this pattern the
service regist industry and the service
Discovery since I'm very logical I'm an
AI generated voice after all let's first
look at the former and as always let's
start with our favorite four sample
microservices and add to this initial
picture our service registry as all
other services the service registry
relies on a database which stores
information on the microservices
available within the ecosystem of a
solution so how does a service registry
work there are two Alternatives the
first one depends on self-serv
registration in this alternative at
startup each microservice registers
itself to the registry and when shutting
down each microservice D registers
simple
right the second alternative relies on a
third party with a registar that takes
the ownership and responsibility to
monitor the health of microservices and
registers or D registers them based on
their health status and yes this implies
that with this alternative if you want a
new microservice to contribute to the
overall solution it must provide the
registar with the ability to monitor its
current state now let's look at the
second component of this pattern the
discovery how does a microservice
discovers its partner in crime well they
discover them thanks to the service
registry database and here again there
are two alternatives for the discovery
pattern in the first alternative each
microservice can query the service
registry to retrieve the needed info of
other microservices
this approach is called a client side
Discovery the second alternative is a
server side discovery which relies on a
proxy to assist each microservice to
interact with others without having to
worry about anything the proxy fully
takes ownership to figure out how to
root requests between microservices
pretty cool
right let's now discuss the circuit
Circuit Breaker
breaker pattern the circuit breaker
pattern aims to one prevent cascading
failures in distributed systems two
improve system resilience and fault
tolerance three reduce the impact of
service failures on the overall system
four allow rapid failure detection and
recovery but how does this pattern work
this pattern operates like an electrical
circuit breaker monitoring the flow of
requests between services but instead of
being a two-state circuit breaker it has
three states closed which is the normal
operation the request pass through open
when a failure is detected the requests
are immediately rejected and half open
when we test if the service has
recovered from a previous failure to
simplify when a service fails repeatedly
the circuit breaker trips to the open
State preventing further requests and
after a defined timeout it switches to
half open to test if the service has
recovered now there are always
challenges and common mistakes to avoid
when implementing this pattern to
enhance the the resilience and
reliability of you microservices
architecture first Common mistake is
setting the failure threshold too low or
too high which can lead to premature
tripping or delayed response to failures
next is failing to set appropriate
timeouts that can result in resources
being held unnecessarily or premature
request termination third it's the lack
of monitoring not implementing proper
monitoring and alerting for circuit
breaker State changes can indeed lead to
undetected issues then we have ignoring
partial fail ures focusing only on
complete service failures and neglecting
degraded performance scenarios another
common mistake is over Reliance on
circuit breakers using circuit breakers
as a sole solution for fault tolerance
is simply wrong rather it should be part
of a comprehensive resilience strategy
and we'll talk about that in another
video last common mistake failing to
thoroughly test the circuit breaker
Behavior under various failure scenarios
can lead to unexpected issues in
production okay let us double click on
how to implement this pattern within our
now Infamous e-commerce
solution okay let's apply the circuit
Example
breaker pattern to our e-commerce
solution and more specifically to the
inventory service to better protect the
product service picture this we've just
received a large shipment of the latest
iPhone in our warehouse and we want to
update the inventory to reflect the
correct items we have in stock the first
thing the inventory service is going to
do is to call the product service to get
the product ID for the latest iPhone the
inventory service calls the product
service and obtains the product ID so
far all is good the circuit breaker from
the inventory service to the product
service is closed some orders are then
placed by our customers to purchase the
new model and the inventory service
calls once again the product service to
ensure the ordered product is the right
one but this time the call fails the
call is retried but fails again this
breaches are defined threshold in the
circuit brake trips after a short time
out using for example an exponential
backoff Logic the call is retried but
fails once more finally after an even
longer time out using some type of
Jitter randomization Logic the circuit
breaker is reset going to the half
openen State allowing the inventory
service to try again the
call this time we're lucky the product
service responds successfully and we can
close the circuit breaker however if the
call fails again then we're going back
to the open state to provide additional
time to the product service to recover
from its failure now as a solution
architect or a microservice owner there
are several critical questions to answer
when implementing this pattern when
should the circuit trip how many failed
requests within a certain period should
we consider for the decision how do we
quantify a failure what's the expected
time or SLA the product service should
respond to our request before we
consider it a failure when does the
circuit can be closed again how long
after a circuit trip we should try again
how long should we give to the product
service to recover long story short
there are a few non-trivial questions
that must be answered before
implementing such pattern and while the
idea of this pattern is fairly simple it
does require us to think carefully on
how to prevent a complete system
failures by stopping calls to a specific
service experiencing a problem of course
this opens another set of intriguing
questions around how to build resilient
systems and this is exactly what we'll
discuss in a future tutorial but first
let's bring together together all the
patterns we discussed today and in part
four and see how our initial monolithic
e-commerce platform is transformed when
applying all these
patterns let us start where it all
Conclusion
begins the customer an end user makes a
call to access our website the request
is handled by our API Gateway since the
customer is not authenticated yet the
API Gateway requests the user to log in
so the user provides their credentials
and obtains an access token from our
identity and access management
microservice obviously the API Gateway
knows where to send the login request
because of our service registry and
Discovery here we use the thirdparty
approach when our microservices start
the registar detects them and updates
the registry then once the user is
finally authenticated and authorized the
user can start navigating our e-commerce
and Shop happily and you can see our
e-commerce solution relies on a message
broker to communicate and fulfill the
users
requests that's neat right so what do we
do next in our next Hands-On tutorial
we'll complete the implementation of our
identity and access management
microservice leveraging JWT and Spring
Security all right this is it for today
but don't you worry there's plenty more
coming so please stay tuned And
subscribe if you'd like to get notified
when the next tutorial is published and
on that note see you soon
O replay do chat está desativado para esta estreia.





A inteligência artificial (IA) deve interagir de diversas maneiras com sistemas ERP (Enterprise Resource Planning) e CRM (Customer Relationship Management), aprimorando a eficiência e a inteligência das operações, abaixo colocamos alguns pontos e que devem ser levados em consideração:
- Automatizar tarefas repetitivas, como a geração de relatórios financeiros, atualizações de inventário e controle de qualidade. Isso reduz erros humanos e aumenta a eficiência.
- Analise dados históricos de saída de peças, atendimento, e outras variáveis, como sazonalidade, a ferramenta pode prever a demanda futura e sugerir ajustes no estoque, evitando excesso ou falta de produtos.
- Monitorar a saúde de equipamentos e prever quando a manutenção será necessária, reduzindo o tempo de inatividade e os custos com reparos inesperados.
- Analise dados de fornecedores e de processos logísticos para otimizar a cadeia de suprimentos, minimizando custos e melhorando os prazos de entrega.
- Permitir de uma forma única, integrar fontes de dados em tempo real, com as operações realizadas, oferecendo insights mais completos e facilitando a tomada de decisões.
- Identificação e mitigação de  riscos de forma proativa, analisando grandes volumes de dados internos e externos, como transações financeiras, dados de mercado e histórico de comportamentos, antecipe riscos financeiros, operacionais e até reputacionais.
- Possibilidade de automatizar o monitoramento da conformidade com regulamentos e políticas internas.
- Possibilidade de detectar padrões de comportamento fraudulentos, analisando transações e atividades suspeitas em tempo real.


@Gerson Aquino eu só acho que não podemos ser Pombo Enxadrista. E isso é um problema que NÃO queremos admitir.
INSS (Instituto Nacional do Seguro Social) é pago por empregadores e trabalhadores.
Empregados (CLT), Empregados domésticos, Autônomos e profissionais liberais, MEIs (Microempreendedores Individuais) e Contribuintes facultativos.
Quem usufrui: Pessoas de baixa renda/situação de rua, Idosos, Pessoas com doenças crônicas e Trabalhadores informais e autônomos.
Estrangeiros em situação irregular, Refugiados e solicitantes de asilo e Turistas/visitantes temporários.

O que o Estado precisa fazer, a meu ver NÃO é dar benécias e sim dar trabalho. Mas como ?
- Trazendo industrias para o País;
- Trazendo evolução (limpeza de rua, saúde - Enfermeira,)


A regra 80/20
O que é: Uma estrutura para focar apenas nos itens de maior impacto.
Por que usar: Evite retornos decrescentes e priorize apenas as poucas atividades de maior impacto.

Coma seu sapo
O que é: Uma regra para concluir a tarefa mais importante primeiro;
Por que usar: Garanta um dia de sucesso desde o início e crie impulso a partir daí;

1-3-5
O que é: Uma regra para ajudar a selecionar apenas algumas tarefas críticas;
Por que usar: Terminamos mais quando nos concentramos em menos;

Técnica Pomodoro
O que é: Sessões de trabalho intervaladas com descanso entre elas;
Por que usar: rajadas curtas seguidas de descansos restauradores aumentam a produtividade;

Trabalho profundo
O que é: Tempo ininterrupto para se concentrar em uma tarefa importante;
Por que usar: multitarefa não funciona concentre-se em apenas um item sem distração para fazer mais;

A matriz de Eisenhower
O que é: Uma maneira de priorizar tarefas;
Por que usar: Ajuda a evitar trabalhos desnecessários e a focar no que é mais importante
