REPORT znovo_open_sql.

TABLES sbook.

SELECT-OPTIONS s_carrid FOR sbook-carrid.

DATA: r_table TYPE REF TO cl_salv_table.

SELECT carrid,
       connid,
       fldate,
       custtype,
       CASE
         WHEN custtype = 'P' THEN 'Bagagem Particular'
         WHEN custtype = 'B' THEN 'Bagagem por empresa'
         ELSE 'Bagagem não identificada'
       END AS text_bagagem,
       MIN( luggweight ) AS minimo,
       MAX( luggweight ) AS maximo
  FROM sbook
  INTO TABLE @DATA(lt_result)
 WHERE carrid IN @s_carrid
   AND luggweight <> '0'
 GROUP BY carrid, connid, fldate, custtype.

IF sy-subrc EQ 0.

  CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table = r_table
    CHANGING
      t_table      = lt_result.

  CALL METHOD r_table->display.
ENDIF.
