REPORT zopen_sql_matematica.

TABLES sbook.

SELECTION-SCREEN BEGIN OF BLOCK 01 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS s_carrid FOR sbook-carrid.
SELECTION-SCREEN END OF BLOCK 01.

DATA r_table TYPE REF TO cl_salv_table.

SELECT carrid
      ,connid
      ,fldate
      ,seatsmax
      ,seatsmax_b
      ,( CAST( seatsmax_b AS FLTP ) * CAST( 100 AS FLTP ) ) / CAST( seatsmax AS FLTP ) AS num_exec
      ,seatsmax_f
      ,( CAST( seatsmax_f AS FLTP ) * CAST( 100 AS FLTP ) ) / CAST( seatsmax AS FLTP ) AS num_pri
  FROM sflight
  INTO TABLE @DATA(lt_result)
 WHERE carrid IN @s_carrid
 ORDER BY carrid.

CHECK lt_result IS NOT INITIAL.

CALL METHOD cl_salv_table=>factory
  IMPORTING
    r_salv_table = r_table
  CHANGING
    t_table      = lt_result.

CALL METHOD r_table->display.
