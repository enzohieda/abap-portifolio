extend view entity ZABAP07EXC02 with
{
    sflight.seatsmax - sflight.seatsocc as dif_assentos,
    sflight.currency,
    @Semantics.amount.currencyCode: 'currency'
    sflight.paymentsum,

    case
        when sflight.paymentsum > 190000 then 'Vôo Lucrativo'
        when sflight.paymentsum < 190000 then 'Vôo sem lucro'
        else 'Vôo com pouco lucro'
    end as lucro
}
