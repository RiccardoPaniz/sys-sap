%dw 2.0
output text/plain

var installation = "Anlage eq '" ++ attributes.queryParams.installationId ++ "'"

fun addHistorical(filter: String, historical: Boolean): String = if (historical) (filter ++ " and Storico eq 'X' and Bis ne datetime'9999-12-31T00:00:00'") else filter
fun addCommon(filter: String, common: Boolean): String = if (common) (filter ++ " and Operand ne 'TUCATEG158'") else filter ++ " and Operand eq 'TUCATEG158'"
fun addOperands(filter: String, operands: String): String = if (operands == "") filter else if (operands contains ",") (filter ++ " and (Operand eq '" ++ (operands replace /,/ with ("' or Operand eq '")) ++ "')") else (filter ++ " and Operand eq '" ++ operands ++ "'")
---

if (isEmpty(attributes.queryParams.operands))
  if (isEmpty(vars.common))
    addHistorical(installation, attributes.queryParams.historical default false)
  else
    addCommon(addHistorical(installation, attributes.queryParams.historical default false), vars.common default false)
else 
  addOperands(addHistorical(installation, attributes.queryParams.historical default false), attributes.queryParams.operands)
