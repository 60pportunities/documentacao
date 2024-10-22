CREATE OR REPLACE FUNCTION separar_clob(p_clob IN CLOB) 
RETURN SYS.ODCIVARCHAR2LIST 
IS
    l_path    VARCHAR2(4000);
    l_file    VARCHAR2(4000);
    l_ext     VARCHAR2(4000);
    l_result   SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST();
BEGIN
    -- Convertendo CLOB para VARCHAR2 (Aqui limita a 4000 caracteres)
    l_path := DBMS_LOB.SUBSTR(p_clob, 4000, 1);
    
    -- Separando pelo delimitador /
    FOR r IN (SELECT REGEXP_SUBSTR(l_path, '[^/]+', 1, LEVEL) AS part
              FROM dual
              CONNECT BY REGEXP_SUBSTR(l_path, '[^/]+', 1, LEVEL) IS NOT NULL)
    LOOP
        -- Separando file e ext pelo delimitador .
        l_file := REGEXP_SUBSTR(r.part, '^[^.]+');
        l_ext := REGEXP_SUBSTR(r.part, '[^.]+$', 1, 1);

        l_result.EXTEND;
        l_result(l_result.COUNT) := 'File: ' || l_file || ', Ext: ' || l_ext;
    END LOOP;

    RETURN l_result;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro ao processar o CLOB: ' || SQLERRM);
END separar_clob;

DECLARE
    l_clob CLOB := '/file1.txt/file2.doc/file3.pdf';
    l_result SYS.ODCIVARCHAR2LIST;
BEGIN
    l_result := separar_clob(l_clob);
    FOR i IN 1 .. l_result.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(l_result(i));
    END LOOP;
END;

/



DECLARE
    v_url            VARCHAR2(4000);
    v_response       CLOB;
    v_http_request   UTL_HTTP.req;
    v_http_response  UTL_HTTP.resp;
    v_buffer         VARCHAR2(32767);
    v_clob           CLOB;
    v_pos            PLS_INTEGER;
    v_file_path      VARCHAR2(4000);
    v_file_name      VARCHAR2(255);
    v_file_ext       VARCHAR2(10);
    v_commit_date    DATE;
    v_project        VARCHAR2(255);
    v_author         VARCHAR2(255);
    v_commit_msg     VARCHAR2(4000);
BEGIN
    -- Configurar a URL da requisição
    v_url := 'https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repositoryId}/commits/{commitId}/changes?top={top}&skip={skip}&api-version=7.1-preview.1';

    -- Fazer a requisição GET
    v_http_request := UTL_HTTP.begin_request(v_url);
    v_http_response := UTL_HTTP.get_response(v_http_request);

    -- Ler a resposta
    DBMS_LOB.createtemporary(v_response, TRUE);
    LOOP
        UTL_HTTP.read_text(v_http_response, v_buffer, 32767);
        DBMS_LOB.writeappend(v_response, LENGTH(v_buffer), v_buffer);
    END LOOP;
    UTL_HTTP.end_response(v_http_response);

    -- Processar a resposta (exemplo simplificado)
    v_clob := v_response;
    v_pos := 1;

    -- Extrair caminhos dos arquivos do CLOB
    LOOP
        v_pos := INSTR(v_clob, ',', v_pos);
        EXIT WHEN v_pos = 0;
        v_file_path := SUBSTR(v_clob, 1, v_pos - 1);
        v_clob := SUBSTR(v_clob, v_pos + 1);
        
        -- Separar nome do arquivo e extensão
        v_file_name := SUBSTR(v_file_path, INSTR(v_file_path, '/', -1) + 1);
        v_file_ext := SUBSTR(v_file_name, INSTR(v_file_name, '.', -1) + 1);
        v_file_name := SUBSTR(v_file_name, 1, INSTR(v_file_name, '.', -1) - 1);

        -- Gerar indicador (exemplo de saída)
        DBMS_OUTPUT.put_line('Objeto: ' || v_file_name || '.' || v_file_ext);
        DBMS_OUTPUT.put_line('Data: ' || v_commit_date);
        DBMS_OUTPUT.put_line('Projeto: ' || v_project);
        DBMS_OUTPUT.put_line('Author: ' || v_author);
        DBMS_OUTPUT.put_line('Mensagem: ' || v_commit_msg);
    END LOOP;

    -- Limpar CLOB temporário
    DBMS_LOB.freetemporary(v_response);
EXCEPTION
    WHEN OTHERS THEN
        UTL_HTTP.end_response(v_http_response);
        RAISE;
END;
/
----



DECLARE
    TYPE json_array_type IS TABLE OF CLOB;
    v_json_array json_array_type := json_array_type();
    v_author VARCHAR2(255);
    v_commit_msg VARCHAR2(4000);
    v_json CLOB;
BEGIN
    -- Exemplo de dados de commits
    FOR i IN 1..5 LOOP
        v_author := 'Autor ' || i; -- Substitua pelo valor real
        v_commit_msg := 'Mensagem do Commit ' || i; -- Substitua pelo valor real

        -- Criar objeto JSON com as informações do commit
        v_json := JSON_OBJECT(
            'author' VALUE v_author,
            'commit_message' VALUE v_commit_msg
        ).to_clob();

        -- Adicionar o objeto JSON ao array
        v_json_array.EXTEND;
        v_json_array(v_json_array.COUNT) := v_json;
    END LOOP;

    -- Exibir o array JSON resultante
    FOR i IN 1..v_json_array.COUNT LOOP
        DBMS_OUTPUT.put_line(v_json_array(i));
    END LOOP;
END;
/





--------------------------------------------------------
--  Arquivo criado - segunda-feira-outubro-07-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table XXBBTS_AZ_PRODUTO
--------------------------------------------------------

  CREATE TABLE "XXBBTS_AZ_PRODUTO" 
   (	"ID_PRODUTO_TIME" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"ID_AZ_PRODUTO" VARCHAR2(240 BYTE) COLLATE "USING_NLS_COMP", 
	"SG_AZ_PRODUTO" VARCHAR2(4000 BYTE) COLLATE "USING_NLS_COMP", 
	"ID_AZ_TIME" VARCHAR2(240 BYTE) COLLATE "USING_NLS_COMP", 
	"SG_AZ_TIME" VARCHAR2(4000 BYTE) COLLATE "USING_NLS_COMP", 
	"CREATION_DATE" DATE DEFAULT SYSDATE, 
	"LAST_UPDATE_DATE" DATE DEFAULT SYSDATE, 
	"DATA_JSON" CLOB COLLATE "USING_NLS_COMP", 
	"TIPO_DE_WIT" VARCHAR2(20 BYTE) COLLATE "USING_NLS_COMP", 
	"TAGS" VARCHAR2(4000 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("DATA_JSON") STORE AS SECUREFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "XXBBTSDEVOPS"."XXBBTS_AZ_PRODUTO"."ID_PRODUTO_TIME" IS 'ID Interno';
  GRANT SELECT ON "XXBBTSDEVOPS"."XXBBTS_AZ_PRODUTO" TO "USR_ANALYTICS";
  GRANT SELECT ON "XXBBTSDEVOPS"."XXBBTS_AZ_PRODUTO" TO "XXBBTSDEVOPSELECT";
REM INSERTING into XXBBTS_AZ_PRODUTO
    SET DEFINE OFF;
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('3b667c17-749c-4a15-9cbf-0aa3539c9510','PSIM - Analytics','3b667c17-749c-4a15-9cbf-0aa3539c9510','PSIM - Analytics',to_date('05/08/24','DD/MM/RR'),to_date('03/10/24','DD/MM/RR'),'Scrum','N_CLASSIF');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('9cdd4d4a-2eab-4026-84d8-fe3acd58d643','BBTS fábrica','9cdd4d4a-2eab-4026-84d8-fe3acd58d643','BBTS fábrica',to_date('05/08/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','N_CLASSIF');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('583a304d-4e95-496d-91ec-eda73ef84e73','NOVA','583a304d-4e95-496d-91ec-eda73ef84e73','NOVA',to_date('19/06/24','DD/MM/RR'),to_date('29/08/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('36c79607-3f84-4b07-9c80-f86617756611','FRAMEWORK BBTS�FFFFFFFFFFFFCF�FFFFFFFFFFFF80DEV','36c79607-3f84-4b07-9c80-f86617756611','FRAMEWORK BBTS�FFFFFFFFFFFFCF�FFFFFFFFFFFF80DEV',to_date('22/04/24','DD/MM/RR'),to_date('05/07/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('1cc6c221-b83f-4214-a18b-08a3f5407cba','E-BBTS','1cc6c221-b83f-4214-a18b-08a3f5407cba','E-BBTS',to_date('05/08/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','CEDIG.SUPOT.GEAPE, responsavel.aline.pimentel, status.ativo, uor.3000005500');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('a2e48a63-81c2-4a2e-bc40-15366ec2da33','CSF_REPORTS','a2e48a63-81c2-4a2e-bc40-15366ec2da33','CSF_REPORTS',to_date('22/04/24','DD/MM/RR'),to_date('22/07/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE,DIFERIMENTO');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('37ca31b5-9279-475a-9b23-01a69fa4334a','ANALYTICS_SOLUTIONS','37ca31b5-9279-475a-9b23-01a69fa4334a','ANALYTICS_SOLUTIONS',to_date('22/04/24','DD/MM/RR'),to_date('03/10/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE, responsavel.aaureliano.santos, status.ativo, uor.3000008023');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('e1472ef6-be93-4733-a9c1-4133f8304142','E-BUSINESS_SUITE_AUTOMATIZA_LOGISTICA','e1472ef6-be93-4733-a9c1-4133f8304142','E-BUSINESS_SUITE_AUTOMATIZA_LOGISTICA',to_date('22/04/24','DD/MM/RR'),to_date('03/10/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE, status.ativo, responsavel.marcus.pessoa, uor.3000008023');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('04a0d99f-096b-42b8-a99b-a306b7a85cb1','EXEMPLO_PROJETO_PLSQL','04a0d99f-096b-42b8-a99b-a306b7a85cb1','EXEMPLO_PROJETO_PLSQL',to_date('22/04/24','DD/MM/RR'),to_date('22/08/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('c50e1578-5c57-438d-8256-c51068b66d2d','PLATAFORMA_INTERNA_DE_DADOS_ANALISE','c50e1578-5c57-438d-8256-c51068b66d2d','PLATAFORMA_INTERNA_DE_DADOS_ANALISE',to_date('22/04/24','DD/MM/RR'),to_date('24/09/24','DD/MM/RR'),'Scrum','N_CLASSIF');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('1b51a2fc-aa2d-41b4-8917-8bff80269400','E_BUSINESS_SUITE','1b51a2fc-aa2d-41b4-8917-8bff80269400','E_BUSINESS_SUITE',to_date('22/04/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE, status.ativo, uor.3000008023, responsavel.vera.silveira');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('8a56edb6-3e4b-42f8-86b9-6c69849882d5','API_ORDS','8a56edb6-3e4b-42f8-86b9-6c69849882d5','API_ORDS',to_date('22/04/24','DD/MM/RR'),to_date('24/09/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('d1042993-4709-481b-b230-c015deab94cf','TAXONE','d1042993-4709-481b-b230-c015deab94cf','TAXONE',to_date('22/04/24','DD/MM/RR'),to_date('27/09/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('83c1d693-a733-48aa-b51c-5829627533e2','p20_021_provisao_e_reversao','83c1d693-a733-48aa-b51c-5829627533e2','p20_021_provisao_e_reversao',to_date('22/04/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE, responsavel.aaureliano.santos, status.ativo, uor.3000008023');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('1c2f1ef4-e6fb-4787-bbb5-f9cf1be4777f','CONTRACHEQUE','1c2f1ef4-e6fb-4787-bbb5-f9cf1be4777f','CONTRACHEQUE',to_date('22/04/24','DD/MM/RR'),to_date('26/04/24','DD/MM/RR'),null,null);
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('cb380c3c-f2ee-4784-b7ec-858a49bdca20','LGPD','cb380c3c-f2ee-4784-b7ec-858a49bdca20','LGPD',to_date('22/04/24','DD/MM/RR'),to_date('22/08/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('e58f35c0-d50b-49d1-98b1-8ddd03095593','PLATAFORMA_DIGITAL_DE_SUPRIMENTOS','e58f35c0-d50b-49d1-98b1-8ddd03095593','PLATAFORMA_DIGITAL_DE_SUPRIMENTOS',to_date('22/04/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE, responsavel.aaureliano.santos, status.ativo, uor.3000008023');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('9f40f28c-687c-4cba-9dc8-2aa37745562e','DevSecOps','9f40f28c-687c-4cba-9dc8-2aa37745562e','DevSecOps',to_date('22/04/24','DD/MM/RR'),to_date('05/06/24','DD/MM/RR'),'Scrum','N_CLASSIF');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('03782aec-29fb-4416-a5e2-52bf1838c63b','HUMANOGRAMA','03782aec-29fb-4416-a5e2-52bf1838c63b','HUMANOGRAMA',to_date('22/04/24','DD/MM/RR'),to_date('30/09/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('ba72bf2d-c3ff-4852-80cd-943ea56eb209','INTEGRACAO_SYSAID','ba72bf2d-c3ff-4852-80cd-943ea56eb209','INTEGRACAO_SYSAID',to_date('22/04/24','DD/MM/RR'),to_date('12/07/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('7ae0202c-ad22-447c-b8b7-59327fabf33b','HORAROSA','7ae0202c-ad22-447c-b8b7-59327fabf33b','HORAROSA',to_date('07/06/24','DD/MM/RR'),to_date('11/06/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('b0b5fa6b-9fc9-401c-9c62-8a10b1787608','Plataforma UX','b0b5fa6b-9fc9-401c-9c62-8a10b1787608','Plataforma UX',to_date('07/08/24','DD/MM/RR'),to_date('02/10/24','DD/MM/RR'),'Scrum','N_CLASSIF');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('2be2e773-463f-479a-adc3-5df8285ebc64','DESAFIO','2be2e773-463f-479a-adc3-5df8285ebc64','DESAFIO',to_date('03/06/24','DD/MM/RR'),to_date('03/06/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('ab5ce3a2-b81c-4c7a-af21-fc5ea47f824d','Mensageria','ab5ce3a2-b81c-4c7a-af21-fc5ea47f824d','Mensageria',to_date('05/08/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','N_CLASSIF');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('7214f93b-8d6d-49dd-b582-8ef8454d3a7e','PASSC','7214f93b-8d6d-49dd-b582-8ef8454d3a7e','PASSC',to_date('05/08/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','responsavel.aaureliano.santos, status.ativo, uor.3000008023');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('23daba68-619c-4919-8b99-a2bdfe6dd2d3','SEGURANCA_INFORMACAO','23daba68-619c-4919-8b99-a2bdfe6dd2d3','SEGURANCA_INFORMACAO',to_date('22/04/24','DD/MM/RR'),to_date('22/08/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('ec85f1f0-3dc7-40b4-a30e-fb843125cd8e','Gescon - Sistema de Gestão de Contratos','ec85f1f0-3dc7-40b4-a30e-fb843125cd8e','Gescon - Sistema de Gestão de Contratos',to_date('22/04/24','DD/MM/RR'),to_date('27/09/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('254ccf1f-8ddb-403d-89be-38695d87a486','SIFAN','254ccf1f-8ddb-403d-89be-38695d87a486','SIFAN',to_date('22/04/24','DD/MM/RR'),to_date('25/09/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('805abc91-cad9-4870-83d7-88b7b301c930','CEDIT - Analytics','805abc91-cad9-4870-83d7-88b7b301c930','CEDIT - Analytics',to_date('22/04/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','CEDIT.SUPOT.GEAPE, 3000008017');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('5337cfc5-f978-49e7-8fee-d0d4932d4da5','PAINEL_TRIBUTARIO','5337cfc5-f978-49e7-8fee-d0d4932d4da5','PAINEL_TRIBUTARIO',to_date('22/04/24','DD/MM/RR'),to_date('12/07/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('d3121040-2c17-4152-9702-4295320c1c03','PAGESCON','d3121040-2c17-4152-9702-4295320c1c03','PAGESCON',to_date('22/04/24','DD/MM/RR'),to_date('22/05/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('11b8c5c2-3de3-46d9-aec6-0e36b7f0ff5e','CESUC_ADMINISTRACAO','11b8c5c2-3de3-46d9-aec6-0e36b7f0ff5e','CESUC_ADMINISTRACAO',to_date('22/04/24','DD/MM/RR'),to_date('22/08/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('efa50f15-a734-4e69-85a6-f37dfb58785e','SUPRAVIZIO','efa50f15-a734-4e69-85a6-f37dfb58785e','SUPRAVIZIO',to_date('22/04/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE, status.ativo, uor.3000008023, responsavel.vera.silveira');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('92fabd20-8f4f-44be-9f0e-3552342d2824','PEOPLESOFT','92fabd20-8f4f-44be-9f0e-3552342d2824','PEOPLESOFT',to_date('22/04/24','DD/MM/RR'),to_date('04/10/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE, status.ativo, uor.3000008023, responsavel.vera.silveira');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('e9d3793a-0515-40e0-9425-1d8b9f183c0a','E-BUSINESS_SUITE_MONITORA','e9d3793a-0515-40e0-9425-1d8b9f183c0a','E-BUSINESS_SUITE_MONITORA',to_date('22/04/24','DD/MM/RR'),to_date('26/04/24','DD/MM/RR'),null,null);
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('fbc38809-1ab4-47f1-a1eb-c5a5443f970a','CEREM - Outsourcing de Telefonia','fbc38809-1ab4-47f1-a1eb-c5a5443f970a','CEREM - Outsourcing de Telefonia',to_date('05/08/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','responsavel.leandro.nakagawa, status.ativo, uor.3000005503');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('e27028db-fac7-4a56-b3bc-86d7a20bd266','Projeto-Base-CEDIG-2','e27028db-fac7-4a56-b3bc-86d7a20bd266','Projeto-Base-CEDIG-2',to_date('07/08/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','N_CLASSIF');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('5de6a069-5cb5-44a6-9efc-35eccf81244d','Intevia','5de6a069-5cb5-44a6-9efc-35eccf81244d','Intevia',to_date('08/08/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','responsavel.milvia.porto, status.ativo, uor.3000005503');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('42b0ba65-6385-457f-ba70-8adcda927e6c','SIIGO','42b0ba65-6385-457f-ba70-8adcda927e6c','SIIGO',to_date('08/08/24','DD/MM/RR'),to_date('25/09/24','DD/MM/RR'),'Scrum','GELOP.SOAUT');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('ff6909d5-fd1a-48fc-91c2-c9eee285fd4d','PRDI','ff6909d5-fd1a-48fc-91c2-c9eee285fd4d','PRDI',to_date('05/08/24','DD/MM/RR'),to_date('11/09/24','DD/MM/RR'),'Scrum','N_CLASSIF');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('586d7e49-b786-4e7f-9e2d-5edbc17d8b54','CESIT - Sistemas Internos','586d7e49-b786-4e7f-9e2d-5edbc17d8b54','CESIT - Sistemas Internos',to_date('07/08/24','DD/MM/RR'),to_date('14/08/24','DD/MM/RR'),'Scrum','N_CLASSIF');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('82fc5136-bf2d-47b0-8c46-76f0fd195231','microfilmagem','82fc5136-bf2d-47b0-8c46-76f0fd195231','microfilmagem',to_date('13/09/24','DD/MM/RR'),to_date('30/09/24','DD/MM/RR'),'Scrum','CEDIG.SUPOT.GEAPE, responsavel.aline.pimentel, status.ativo, uor.3000005500');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('5b54a6ac-5694-46b2-8402-6ff58fcc0882','GESCONFASE04','5b54a6ac-5694-46b2-8402-6ff58fcc0882','GESCONFASE04',to_date('22/04/24','DD/MM/RR'),to_date('02/09/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('4e36c22a-42d5-42b1-81f8-197b0f790fdb','HYDRA','4e36c22a-42d5-42b1-81f8-197b0f790fdb','HYDRA',to_date('22/04/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE, responsavel.luiz.santos, status.ativo, uor.3000008023');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('4f560117-6bb2-4582-9508-b89b8fbe72bb','PRECIFICACAO','4f560117-6bb2-4582-9508-b89b8fbe72bb','PRECIFICACAO',to_date('22/04/24','DD/MM/RR'),to_date('22/08/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('23851fcd-44d9-438a-b8f8-c46a3ba74bdc','DOCUMENTOS_FISCAIS_ELETRONICOS','23851fcd-44d9-438a-b8f8-c46a3ba74bdc','DOCUMENTOS_FISCAIS_ELETRONICOS',to_date('22/04/24','DD/MM/RR'),to_date('04/10/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE, responsavel.aaureliano.santos, status.ativo, uor.3000008023');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('d99da928-4f11-4580-b475-ea2f81e8aed7','SISLOC','d99da928-4f11-4580-b475-ea2f81e8aed7','SISLOC',to_date('06/05/24','DD/MM/RR'),to_date('22/08/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('8124c74c-ecde-41a7-8dc6-7df1a9b62774','ICN','8124c74c-ecde-41a7-8dc6-7df1a9b62774','ICN',to_date('07/08/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','CEDIG.SUPOT.GEAPE, status.ativo, uor:3000005500, responsavel.aline.pimentel');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('c0b3bc8d-1f38-4bdd-a5c2-c583ea86476d','PRDI-M','c0b3bc8d-1f38-4bdd-a5c2-c583ea86476d','PRDI-M',to_date('07/08/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','CEDIT.SUPOT.GEAPE, responsavel.gustavo.meireles, status.ativo, uor.3000008017');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('76927a49-3947-43b9-9711-56fcc4d51476','NOTA_FISCAL_NDD','76927a49-3947-43b9-9711-56fcc4d51476','NOTA_FISCAL_NDD',to_date('30/04/24','DD/MM/RR'),to_date('22/08/24','DD/MM/RR'),'Scrum','CESUC.SUPOT.GEAPE');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('834e94ea-8d90-4b9b-9541-39fb41276452','PROTEC','834e94ea-8d90-4b9b-9541-39fb41276452','PROTEC',to_date('10/07/24','DD/MM/RR'),to_date('12/07/24','DD/MM/RR'),'Scrum','PROTEC');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('12739a8d-f575-41a6-a2aa-0c666230bff8','Portal - Autonegociação','12739a8d-f575-41a6-a2aa-0c666230bff8','Portal - Autonegociação',to_date('06/08/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','CEDIT.SUPOT.GEAPE, status.ativo, uor.3000008017, responsavel.gustavo.meireles');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('55d8de67-a717-4fe2-9bce-fb924b2d9675','Postos de serviço','55d8de67-a717-4fe2-9bce-fb924b2d9675','Postos de serviço',to_date('07/08/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','CEDIG.SUPOT.GEAPE, responsavel.aline.pimentel, status.ativo, uor.3000005500');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('883d34b0-8082-4ff0-b803-72db1c2f1bd5','Correspondente Bancário','883d34b0-8082-4ff0-b803-72db1c2f1bd5','Correspondente Bancário',to_date('06/08/24','DD/MM/RR'),to_date('16/09/24','DD/MM/RR'),'Scrum','N_CLASSIF');
    Insert into XXBBTS_AZ_PRODUTO (ID_AZ_PRODUTO,SG_AZ_PRODUTO,ID_AZ_TIME,SG_AZ_TIME,CREATION_DATE,LAST_UPDATE_DATE,TIPO_DE_WIT,TAGS) values ('6d6c63f9-26a0-49fd-bee9-1c3cdaf65a9a','PSIM','6d6c63f9-26a0-49fd-bee9-1c3cdaf65a9a','PSIM',to_date('06/08/24','DD/MM/RR'),to_date('07/10/24','DD/MM/RR'),'Scrum','CECOF.SRE.GETIC, responsavel.michael.lopes, status.ativo, uor.1000002031');
--------------------------------------------------------
--  DDL for Index XXBBTS_AZ_PRODUTO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XXBBTSDEVOPS"."XXBBTS_AZ_PRODUTO_PK" ON "XXBBTSDEVOPS"."XXBBTS_AZ_PRODUTO" ("ID_PRODUTO_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table XXBBTS_AZ_PRODUTO
--------------------------------------------------------

  ALTER TABLE "XXBBTSDEVOPS"."XXBBTS_AZ_PRODUTO" MODIFY ("ID_PRODUTO_TIME" NOT NULL ENABLE);
  ALTER TABLE "XXBBTSDEVOPS"."XXBBTS_AZ_PRODUTO" MODIFY ("ID_AZ_PRODUTO" NOT NULL ENABLE);
  ALTER TABLE "XXBBTSDEVOPS"."XXBBTS_AZ_PRODUTO" MODIFY ("SG_AZ_PRODUTO" NOT NULL ENABLE);
  ALTER TABLE "XXBBTSDEVOPS"."XXBBTS_AZ_PRODUTO" MODIFY ("ID_AZ_TIME" NOT NULL ENABLE);
  ALTER TABLE "XXBBTSDEVOPS"."XXBBTS_AZ_PRODUTO" MODIFY ("SG_AZ_TIME" NOT NULL ENABLE);
  ALTER TABLE "XXBBTSDEVOPS"."XXBBTS_AZ_PRODUTO" ADD CONSTRAINT "XXBBTS_AZ_PRODUTO_CHK1" CHECK ((DATA_JSON IS JSON)) DISABLE;
  ALTER TABLE "XXBBTSDEVOPS"."XXBBTS_AZ_PRODUTO" ADD CONSTRAINT "XXBBTS_AZ_PRODUTO_PK" PRIMARY KEY ("ID_PRODUTO_TIME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
