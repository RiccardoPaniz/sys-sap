%dw 2.0
output application/java

fun formatDate(str: String): String = (if (isEmpty(str)) "9999-12-31T00:00:00" else str as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ "T00:00:00")

---
{
	"Anlage" : payload[0].Instln_Premise__c,
	"OperandHeadItem" : payload map (item, index) -> {
		("Anlage" : item.Instln_Premise__c) if (!isEmpty(item.Instln_Premise__c)),
		("Operand" : item.ALIA_CodiceOperando__c) if (!isEmpty(item.ALIA_CodiceOperando__c)),
/*
		"Ab" : if (isEmpty(item.Date_validity_start_Common__c))
			   (if (isEmpty(item.ALIA_Date_validity_start_158__c)) formatDate(item.ALIA_Date_validity_start_Reduction_Facil__c default "")
			   	else formatDate(item.ALIA_Date_validity_start_158__c)
			   )
			   else formatDate(item.Date_validity_start_Common__c),
		"Bis" : if (isEmpty(item.Date_validity_end_Common__c))
			   (if (isEmpty(item.ALIA_Date_validity_end_158__c)) formatDate(item.ALIA_Date_validity_end_Reduction_Facil__c default "")
			   	else formatDate(item.ALIA_Date_validity_end_158__c)
			   )
			   else formatDate(item.Date_validity_end_Common__c),
*/
		"Ab" : formatDate(item.Date_validity_start_Common__c  default ""),
		"Bis" : formatDate(item.Date_validity_end_Common__c default ""),
		"Valore" : if (isEmpty(item.ALIA_TipoTariffa_Value__c)) item.ALIA_TipoTariffa__c else item.ALIA_TipoTariffa_Value__c,
//		("Kondigr" : item.ALIA_GruppoInfoTariffe__c) if (item.ALIA_GruppoInfoTariffe__c != null)
		("Kondigr" : item.ALIA_Gruppi_Info__c) if (!isEmpty(item.ALIA_Gruppi_Info__c))
	}
}
