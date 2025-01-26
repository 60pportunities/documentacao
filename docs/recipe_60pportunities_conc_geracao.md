![](img/geracao-001.png)
****
| Geração                          | Entenda |
| -----                            | -----   |
| Baby Boomers (Explosão de Bebês) | Valorizam um emprego fixo e estável, se importando mais com sua experiência do que com sua capacidade de inovação.       |
|                                  | Preferência por qualidade e não quantidade. |
|                                  | Não é influenciado por terceiros;           |
| Geração "X"                    | Filhos dos Baby Boomers                     |
|                                  | Busca da individualidade sem a perda da convivência em grupo; |
|                                  | Maturidade e escolha de produtos de qualidade e inteligência; |
|                                  | Ruptura com as gerações anteriores e seus paradigmas; |
|                                  | Busca maior por seus direitos; |
|                                  | Procura de liberdade. |
| Geração "Y" (Milennials)         | Geração que desenvolveu-se em uma época marcada pelo avanço da tecnologia e prosperidade econômica.  |
|                                  | Estão sempre conectados; |
|                                  | Procuram informação fácil e imediata; |
|                                  | Vivem em redes de relacionamento virtuais; |
|                                  | Compartilham tudo o que é seu: dados, fotos, hábitos. etc; |
|                                  | Tem um grande fluxo de informações diariamente. |
| Geração "Z"                     | “nativas digitais”, estando desde pequenos já familiarizadas com a internet e todas suas possibilidades, com o compartilhamento de arquivos constantes, com os smartphones, tablets, e principalmente estando sempre conectadas e “ligadas” ao que acontece em tempo real. |
|                                  | Desapegado das fronteiras geográficas;
|                                  | Demasiados ansiosos;
|                                  | Falta de intimidade e relação social;
|                                  | Necessidade extrema de interação e exposição de opinião.
| Geração Alpha                    | vive um momento em que se preza a diversidade e a espontaneidade.  |
|                                  | Hiperconectividade; |
|                                  | Novas configurações familiares; |
|                                  | Independência e autonomia; |
|                                  | Estímulos constantes; |
|                                  | Preocupação com a saúde mental; |
|                                  | Valorização das experiências; |

<!--

Baby Boomers	         314   - 1946 AND 1964 Baby Boomers
Geração X	            1281   - 1965 AND 1980 Geração X
Geração Y (Millennials)	1496   - 1981 AND 1996 Geração Y (Millennials)
Geração Z	             122   - 1997 AND 2012 Geração Z



SELECT
    CASE
        WHEN to_char(birthdate,'YYYY') BETWEEN 1946 AND 1964 THEN 'Baby Boomers'
        WHEN to_char(birthdate,'YYYY') BETWEEN 1965 AND 1980 THEN 'Geração X'
        WHEN to_char(birthdate,'YYYY') BETWEEN 1981 AND 1996 THEN 'Geração Y (Millennials)'
        WHEN to_char(birthdate,'YYYY') BETWEEN 1997 AND 2012 THEN 'Geração Z'
        WHEN to_char(birthdate,'YYYY') >= 2013 THEN 'Geração Alpha'
        ELSE 'Data de Nascimento Inválida'
    END AS geracao,
    count(*)
FROM xxbbtsgate.vw_people_x_ebs
-->
