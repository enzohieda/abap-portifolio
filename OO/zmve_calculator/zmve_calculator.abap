REPORT zmve_calculator.

CLASS lcl_main DEFINITION.

  PUBLIC SECTION.
    CLASS-METHODS main.

*Variaveis Globais
    CLASS-DATA: go_calculator TYPE REF TO zmvecl_calculadora,
                gv_result     TYPE zmvee_valores_calc,
                gv_msg        TYPE string,
                gv_operation  TYPE domvalue_l.

  PRIVATE SECTION.

*   Métodos e atributos para o processamento do programa
    CLASS-METHODS: instance_calculator, process_calculator, display_result, check_operation RETURNING VALUE(rv_exist) TYPE bool.

ENDCLASS.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

  PARAMETERS p_oper TYPE char1 OBLIGATORY.
  PARAMETERS p_valor1 TYPE zmvee_valores_calc OBLIGATORY.
  PARAMETERS p_valor2 TYPE zmvee_valores_calc OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.

CLASS lcl_main IMPLEMENTATION.

  METHOD main.

    gv_operation = p_oper.

    instance_calculator( ).

    IF go_calculator IS BOUND.

      IF check_operation( ) EQ abap_true.


        process_calculator( ).
        display_result( ).

      ELSE.
        WRITE TEXT-003.
      ENDIF.


    ELSE.

      WRITE TEXT-002.

    ENDIF.

  ENDMETHOD.

  METHOD instance_calculator.

    CREATE OBJECT go_calculator
      EXPORTING
        iv_valor1 = p_valor1                 " Valores da calculadora
        iv_valor2 = p_valor2.                 " Valores da calculadora

  ENDMETHOD.

  METHOD process_calculator.

    IF go_calculator IS BOUND.

      CASE gv_operation.
        WHEN '+'.
          gv_result = go_calculator->somar( ).
        WHEN '-'.
          gv_result = go_calculator->subtrair( ).
        WHEN '*'.
          gv_result = go_calculator->multiplicar( ).
        WHEN  '/'.
          go_calculator->dividir(
            IMPORTING
              ev_result = gv_result               " Valores da calculadora
              ev_msg    = gv_msg
          ).
        WHEN OTHERS.
          WRITE TEXT-003.
      ENDCASE.

    ENDIF.

  ENDMETHOD.

  METHOD display_result.

    IF gv_msg IS NOT INITIAL.

      WRITE gv_msg.

    ELSEIF gv_result IS NOT INITIAL.

      WRITE gv_result.

    ENDIF.

  ENDMETHOD.

  METHOD check_operation.

    IF p_oper IS NOT INITIAL.

      SELECT SINGLE domvalue_l, ddlanguage, ddtext FROM dd07v
  INTO @DATA(ls_dd07v)
  WHERE domname EQ 'ZMVED_OPERACAO'
    AND domvalue_l EQ @gv_operation
    AND ddlanguage EQ @sy-langu.

      IF sy-subrc EQ 0.

        rv_exist = abap_true.

      ENDIF.

    ENDIF.

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  lcl_main=>main( ).
