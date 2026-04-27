# CDS Views - SAP ABAP S/4HANA

Exemplos práticos de Core Data Services (CDS) desenvolvidos durante treinamento SAP ABAP S/4HANA pela GPLUX.

## Arquivos

### ZABAP07EXC02 - CDS View Entity
CDS View Entity baseada na tabela `sflight`. Demonstra:
- Definição de chaves
- Uso de `concat` para criar campo calculado (`num_voo`)
- Annotations de OData, controle de acesso e extensibilidade

### ZABAP07EXC02E - CDS View Extend
Extensão da view `ZABAP07EXC02`. Demonstra:
- Uso de `extend view entity`
- Campo calculado com subtração entre campos (`dif_assentos`)
- Lógica condicional com `case/when` para classificar lucratividade
- Annotation `@Semantics.amount.currencyCode`

### ZABAP07EXC03 - CDS View com Associations
CDS View com join e múltiplas associations. Demonstra:
- `inner join` entre tabelas `sflight` e `scarr`
- Associations `[0..1]` e `[0..*]` com `$projection`
- `cast` para tipagem de campos decimais
- Exposição via OData

### ZABAP070925EXEC05 - CDS Table Function
CDS Table Function implementada via AMDP. Demonstra:
- Definição de `table function` com parâmetros e retorno tipado
- Vínculo com classe ABAP via `implemented by method`

### ZABAP07EXC08 - Classe AMDP
Classe ABAP que implementa a Table Function acima. Demonstra:
- Interface `if_amdp_marker_hdb`
- Método `BY DATABASE PROCEDURE FOR HDB LANGUAGE SQLSCRIPT`
- Execução de SQL nativo no SAP HANA dentro do ABAP

### ZABAP07EXC10 - CDS View com Tabelas Customizadas
CDS View criada sobre tabelas Z customizadas (`zcarros`, `zmontadoras`, `zreservas`) — sistema de reservas de veículos criado do zero. Demonstra:
- Modelagem e criação de tabelas customizadas no dicionário SAP
- `inner join` entre tabelas Z
- Associations para tabelas de reservas e montadoras
- `cast` de campos decimais e exposição via OData
