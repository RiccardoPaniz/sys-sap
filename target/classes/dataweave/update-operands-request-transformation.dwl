%dw 2.0
output application/java

fun formatDate(str: String): String = (if (isEmpty(str)) "9999-12-31T00:00:00" else str as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ "T00:00:00")

---
{
	"Anlage" : payload[0].Instln_Premise__c,
	"CaseId" : payload[0].CaseId,
//	"Correlationid" : correlationId,
	"ProcessCode" : message.message.serialVersionUID as String,
	"CorrelationId" : correlationId,
	"OperandHeadItemChange" : payload map (item, index) -> {
		"CaseId" : payload[0].CaseId,
//		"CorrelationId" : correlationId,
		"ProcessCode" : message.message.serialVersionUID as String,
		"CorrelationId" : correlationId,
		("Operand" : item.ALIA_CodiceOperando__c) if (!isEmpty(item.ALIA_CodiceOperando__c)),
		("Anlage" : item.Instln_Premise__c) if (!isEmpty(item.Instln_Premise__c)),
		"Fdate" : formatDate(item.Date_validity_start_Common__c  default ""),
		"Tdate" : formatDate(item.Date_validity_end_Common__c default ""),
		"Value" : if (isEmpty(item.ALIA_TipoTariffa_Value__c)) item.ALIA_TipoTariffa__c else item.ALIA_TipoTariffa_Value__c,
		("Kondigr" : item.ALIA_Gruppi_Info__c) if (!isEmpty(item.ALIA_Gruppi_Info__c))
	}
}
