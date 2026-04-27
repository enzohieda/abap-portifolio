# Open SQL - SAP ABAP S/4HANA

Exemplos práticos de Open SQL moderno desenvolvidos durante treinamento SAP ABAP S/4HANA pela GPLUX.

## Arquivos

### novo_open_sql.abap
Report com Open SQL moderno baseado na tabela `sbook`. Demonstra:
- Uso de `@DATA` para declaração inline de tabela interna
- `SELECT-OPTIONS` para filtro dinâmico
- Lógica condicional com `CASE/WHEN` diretamente no SELECT
- Funções de agregação `MIN` e `MAX`
- `GROUP BY` para agrupamento de resultados
- Exibição via `cl_salv_table`

### open_sql_matematica.abap
Report com cálculos matemáticos no Open SQL baseado na tabela `sflight`. Demonstra:
- Uso de `CAST` para conversão de tipos no SELECT
- Cálculo de percentual diretamente na query (`seatsmax_b / seatsmax * 100`)
- `SELECTION-SCREEN` com bloco e frame
- `ORDER BY` no SELECT
- Exibição via `cl_salv_table`
