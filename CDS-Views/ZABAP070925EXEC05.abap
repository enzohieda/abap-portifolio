@EndUserText.label: 'Cds view - Exercicio 02 - Table function'
define table function zabap070925exec05
with parameters parameter_name : parameter_type
returns {
    mandt: abap.clnt;
    carrid: s_carrid;
    carrname: s_carrname;
    connid: s_conn_id;
    fldate: s_date;
    bookid: s_book_id;
    custtype: s_custtype;
    smoker: s_smoker;
}
implemented by method zabap07exec08=>Get;
