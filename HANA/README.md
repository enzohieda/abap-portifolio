# HANA - SAP ABAP S/4HANA

Exemplos práticos de desenvolvimento com SAP HANA desenvolvidos durante treinamento SAP ABAP S/4HANA pela GPLUX.

## Arquivos

### sql_nativo_adbc.abap
Report com SQL Nativo via ABAP Database Connectivity (ADBC). Demonstra:
- Uso de `cl_sql_statement` e `cl_sql_connection` para conexão nativa ao HANA
- Montagem de SQL nativo com `CONCATENATE`
- Execução de query com `execute_query`
- Tratamento de resultado com `cl_sql_result_set`
- `inner join` entre tabelas `sflight`, `sbook` e `scarr`
- Funções de agregação `count(*)` e cálculo de percentual em SQL nativo
- Tratamento de exceção com `CATCH cx_sql_exception`
- Exibição via `cl_salv_table`

### relatorio_hana_carros.abap
Report HANA criado sobre tabelas Z customizadas — sistema de reservas de veículos criado do zero. Demonstra:
- `INNER JOIN` entre três tabelas customizadas (`zcarros`, `zreservas`, `zmontadoras`)
- Funções de agregação `COUNT` e `SUM` no Open SQL moderno
- `GROUP BY` e `ORDER BY` combinados
- `SELECT-OPTIONS` para filtro por montadora
- Declaração inline com `@DATA`
- Exibição via `cl_salv_table`
