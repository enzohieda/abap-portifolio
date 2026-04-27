@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exercicio 2 CDS View'
@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog.extensibility.extensible: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@OData.publish: true

define view entity ZABAP07EXC02
                  as select from sflight
{
    key carrid,
    key connid,
    key fldate,
    concat(concat(carrid, '-'),connid) as num_voo,
    planetype,
    seatsmax
}
