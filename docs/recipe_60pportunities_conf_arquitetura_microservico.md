Uma arquitetura de microsserviços trata de dividir um aplicativo em uma coleção de serviços pequenos e fracamente acoplados. 

Cada serviço executa um processo exclusivo e se comunica por meio de uma API bem definida. 

Cada serviço é uma base de código separada, que pode ser gerenciada por uma pequena equipe de desenvolvimento e implantada de forma independente. 

## Principais elementos da arquitetura de microsserviços:

- [x] Balanceador de carga: garante a distribuição uniforme do tráfego de rede de entrada em vários servidores.
- [x] CDN (Content Delivery Network): Um sistema de servidor distribuído que fornece conteúdo da web com base na localização do usuário. Trata-se de aproximar o conteúdo do usuário final, tornando o carregamento da página mais rápido.
- [x] API Gateway: gerencia solicitações direcionando-as para o microsserviço apropriado usando a API REST ou outros protocolos. 
- [x] Gerenciamento: Monitorar e coordenar os microsserviços, garantindo que eles funcionem com eficiência e se comuniquem de forma eficaz.
- [x] Microsserviços: cada microsserviço lida com uma funcionalidade distinta, permitindo um desenvolvimento focado e uma solução de problemas mais fácil. Eles podem conversar uns com os outros usando RPC (Chamada de Procedimento Remoto). Os serviços são responsáveis por persistir seus próprios dados ou estado externo.

### Benefícios

- [x] Escalabilidade: escale verticalmente partes específicas de um aplicativo sem afetar outras.
- [x] Flexibilidade: cada microsserviço pode ser desenvolvido, implantado e dimensionado de forma independente.
- [x]  Resiliência: se um microsserviço falhar, ele não afetará todo o sistema.
- [x] Implantações mais rápidas: bases de código menores significam lançamentos de recursos mais rápidos.

### Inconvenientes

- [x] Complexidade: Mais serviços podem levar a um sistema mais complexo.
- [x] Consistência de dados: Manter a consistência entre os serviços pode ser um desafio.
- [x] Latência de rede: A comunicação entre serviços pode introduzir atrasos.
- [x] Tratamento de erros: quando um erro acontece, é difícil depurar por que e onde ele aconteceu.

Embora a arquitetura de microsserviços não seja uma bala de prata, é uma ferramenta para o desenvolvimento de software moderno.