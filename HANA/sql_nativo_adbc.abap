REPORT zabap000925exec04.

TYPES: BEGIN OF ty_result,
         carrid    TYPE sbook-carrid,
         carrname  TYPE scarr-carrname,
         connid    TYPE sbook-connid,
         fldate    TYPE sbook-fldate,
         seatsmax  TYPE sflight-seatsmax,
         fumantes  TYPE i,
         percentual TYPE p DECIMALS 2,
       END OF ty_result.

DATA lt_result TYPE STANDARD TABLE OF ty_result.

DATA: lo_sql    TYPE REF TO cl_sql_statement,
      lx_sql    TYPE REF TO cx_sql_exception,
      lo_exc    TYPE REF TO cx_root,
      lo_result TYPE REF TO cl_sql_result_set,
      lr_result TYPE REF TO data.

DATA lv_sql TYPE string.

DATA r_table TYPE REF TO cl_salv_table.

TRY.

    CREATE OBJECT lo_sql EXPORTING con_ref = cl_sql_connection=>get_abap_connection( 'LCA' ).

    CONCATENATE
      ` SELECT DISTINCT `
      ` b.carrid `
      ` , c.carrname `
      ` , b.connid `
      ` , b.fldate `
      ` , a.seatsmax `
      ` , count(*) fumantes `
      ` , ( count(*) * 100 / a.seatsmax ) percentual`
      ` from sflight as a inner join sbook as b `
      ` on  a.carrid = b.carrid `
      ` and a.connid = b.connid `
      ` and a.fldate = b.fldate `
      ` inner join scarr as c `
      ` on  a.carrid = c.carrid `
      ` where a.mandt = '` sy-mandt `'`
      ` and  b.mandt = '` sy-mandt `'`
      ` and  c.mandt = '` sy-mandt `'`
      ` and  b.smoker = 'X' `
      ` group by `
      ` b.carrid `
      ` , c.carrname `
      ` , b.connid `
      ` , b.fldate `
      ` , a.seatsmax `
    INTO lv_sql.

    lo_result = lo_sql->execute_query( lv_sql ).

    GET REFERENCE OF lt_result INTO lr_result.
    lo_result->set_param_table( lr_result ).
    lo_result->next_package( ).
    lo_result->close( ).

    CALL METHOD cl_salv_table=>factory
      IMPORTING
        r_salv_table = r_table
      CHANGING
        t_table      = lt_result.

    CALL METHOD r_table->display.

  CATCH cx_sql_exception INTO lo_exc.
    MESSAGE lo_exc TYPE 'E'.
ENDTRY.
