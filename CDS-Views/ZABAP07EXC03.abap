@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - View 03 - Associantion'
@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog.extensibility.extensible: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@OData.publish: true

define view entity ZABAP07EXC03
                // with parameters p_carrid : s_carr_id
                as select from sflight as a
                inner join scarr as b on a.carrid = b.carrid

association[0..*] to sbook as _sbook on _sbook.carrid = $projection.carrid and //projection pega a linha na sbook
                                        _sbook.connid = $projection.connid and
                                        _sbook.fldate = $projection.fldate

association[0..1] to scarr as _scarr on _scarr.carrid = $projection.carrid

association[0..1] to zabap07exc01 as _fumantes on _fumantes.carrid = $projection.carrid
                                               and _fumantes.connid = $projection.connid
                                               and _fumantes.fldate = $projection.fldate
{
    key a.carrid,
    key a.connid,
    key a.fldate,
    b.carrname as Carrname,
    cast( a.price as abap.dec( 15, 2 )) as price,
    a.currency,
    a.planetype,
    a.seatsmax,
    a.seatsocc,
    cast( a.paymentsum as abap.dec( 17, 2 )) as paymentsum,
    a.seatsmax_b,
    a.seatsocc_b,
    a.seatsmax_f,
    a.seatsocc_f,

    //Associantion
    _sbook,
    _scarr,
    _fumantes

}

//where a.carrid = $parameters. p_carrid
