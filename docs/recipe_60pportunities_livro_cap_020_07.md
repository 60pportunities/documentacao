## Trabalhe pequeno e construa incrementalmente
Você começa a trabalhar pequeno e a construir incrementalmente usando sinalizadores de recursos, não é preciso muito para criar um processo de revisão de RP de alto rendimento.

- [x] Há muitas etapas que precisam ser concluídas ao levar um projeto da concepção à implantação.
      - [x] Permitir pequenas mudanças incrementais, cada uma das quais pode ser implantada com segurança na produção.
      - [x] Ao usar sinalizadores de recurso, cada PR deve representar uma quantidade relativamente pequena e altamente focada de trabalho.
- [x] A medida que você diminui o escopo da mudança, você aumenta o número de pessoas que são elegíveis para revisar o PR.
- [x] O passo mais lento e imprevisível nesse processo é a revisão do pull request.
- [x] Permitir pequenas mudanças incrementais, cada uma das quais pode ser implantada com segurança na produção.
- [ ]
### WIP vs. Pronto
Adicione Work in Progress(**WIP**) ao título da sua solicitação de pull se sua intenção for preparar o revisor para uma sessão de feedback profunda e crítica.

Omita **WIP** se sua intenção for buscar aprovação para código pronto para ser implantado, então, comunique que essa é agora a expectativa para a equipe.

- [x] Revisão pessoal: um lugar para ver seu próprio código em um contexto diferente.
- [x] Revisão externa: um lugar para compartilhar seu código com seus colegas.

O envio de códigos precisa se tornar um processo de todos. O que significa que, quando uma solicitação pull estiver pronta para revisão, todos as pessoas relevantes precisam saber sobre ela;

## O código concluído é a maior prioridade
Se você quer que seu código se torne uma alta prioridade, descubra como dividi-lo em pequenas mudanças significativas, coloque-as atrás de um sinalizador de recurso e, então, envie-as incrementalmente.

## Os revisores não são responsáveis ​​por bugs
você é o único responsável por garantir o sucesso desse código.
Não é trabalho da equipe de QA pegar bugs. Não é trabalho do revisor de RP pegar bugs. É trabalho do autor do código, e de mais ninguém.






Planejamento
1. Address Technical, Security Debt, DevSec Metrics, Threat Modeling, Security Tool Training
Create
2. IDE Security Plug-Ins
Verify
3. SAST/DAST/IAST,SCA
PreProd
4. Chaos Monkey,Input Fuzzing, Integration Test
Release
5. Software Signing
Prevent
6. Signature Verify, Integrity Checks, Defense In-Depth Measures
Detect
7. RASP, UEBA/Network Monitoring, Penetration Test
Respond
8. Security Orchestration, RASP/WAF Shielding, Obfuscation
Predict
9.  Dev Consumable, Correlated Vulnerability Analysis, loC/TI STIX TAXII
Adapt
10. Security Technical Debt, Modify Incident Response, Modify DND
