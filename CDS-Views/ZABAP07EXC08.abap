CLASS zabap07exec08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb.

  TYPES:
        BEGIN OF ty_sbook,
          carrid TYPE sbook-carrid,
          connid TYPE sbook-connid,
          fldate TYPE sbook-fldate,
          bookid TYPE sbook-bookid,
        END OF ty_sbook.

  TYPES: tt_sbook TYPE STANDARD TABLE OF ty_sbook.

  class-METHODS zbooks
  IMPORTING
  VALUE(iv_carrid) type sbook-carrid
  EXPORTING
  VALUE(et_sbook) TYPE tt_sbook.

ENDCLASS.

CLASS zabap07exec08 IMPLEMENTATION.

  METHOD zbooks BY DATABASE PROCEDURE
                FOR HDB LANGUAGE SQLSCRIPT
                OPTIONS READ-ONLY
                USING sbook.
    et_sbook = select carrid,
                      connid,
                      fldate,
                      bookid
                      from sbook
                      where carrid = :iv_carrid;
  endmethod.

ENDCLASS.
