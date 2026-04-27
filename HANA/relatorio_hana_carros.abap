REPORT zrelatorio_hana_carros.

TABLES: zmontadoras.

SELECT-OPTIONS s_montad FOR zmontadoras-id_montadora.

DATA: r_table TYPE REF TO cl_salv_table.

SELECT a~id_montadora,
       c~nome,
       a~id_modelo,
       a~nome_modelo,
       COUNT( b~id_reserva ) AS qtd_reservas,
       SUM( b~valor_total )  AS valor_total
  FROM zcarros AS a INNER JOIN zreservas AS b
    ON a~id_montadora = b~id_montadora AND
       a~id_modelo    = b~id_modelo
  INNER JOIN zmontadoras AS c
    ON a~id_montadora = c~id_montadora
  WHERE a~id_montadora IN @s_montad
  GROUP BY a~id_montadora,
           c~nome,
           a~id_modelo,
           a~nome_modelo
  ORDER BY a~id_montadora,
           a~id_modelo
  INTO TABLE @DATA(lt_collect).

CALL METHOD cl_salv_table=>factory
  IMPORTING
    r_salv_table = r_table
  CHANGING
    t_table      = lt_collect.

CALL METHOD r_table->display.
