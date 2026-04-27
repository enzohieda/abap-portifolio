@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View association'
@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog.extensibility.extensible: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@OData.publish: true

define view entity ZABAP07EXC10
as select from zcarros as a
    inner join zmontadoras as b
        on a.id_montadora = b.id_montadora

  association [0..1] to zmontadoras as _montadora
    on _montadora.id_montadora = $projection.id_montadora

  association [0..*] to zreservas as _reservas
    on  _reservas.id_montadora = $projection.id_montadora
    and _reservas.id_modelo    = $projection.id_modelo
{
    key a.id_montadora,
    key a.id_modelo,

    b.nome,
    a.nome_modelo,
    cast( a.preco_base as abap.dec( 15, 2 ) ) as preco_base,
    a.codmoe,

    _montadora,
    _reservas
}
