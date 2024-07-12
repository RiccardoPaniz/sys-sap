%dw 2.0
output application/json skipNullOn="everywhere"
---
if (payload == null or payload == [])
	[]
else
	payload map (item, index) -> {
    	"ALIA_OLDKEY_Instl__c" : item.Anlage,
    	"ALIA_CodiceOperando__c" : item.Operand,
	    "ALIA_Gruppi_Info__c" : item.Kondigr,
	    "ALIA_GruppoInfoTariffe__c" : item.Tarifart,
	    "ALIA_Descrizione__c" : item.OperandDesc,
	    ("ALIA_Date_validity_start_158__c" : item.Ab as Date {format: "yyyy-MM-dd"} as String {format: "yyyyMMdd"}) if (!isEmpty(item.Ab) and (item.Ab as String != "9999-12-31")),
	    ("ALIA_Date_validity_end_158__c" : item.Bis as Date {format: "yyyy-MM-dd"} as String {format: "yyyyMMdd"}) if (!isEmpty(item.Bis) and (item.Bis as String != "9999-12-31")),
		("ALIA_TipoTariffa_Value__c" : item.Valore) if (!isEmpty(item.Valore)),
		("Date_validity_start_Common__c": item.Ab as Date {format: "yyyy-MM-dd"} as String {format: "yyyyMMdd"}) if (!isEmpty(item.Ab) and (item.Ab as String != "9999-12-31")),
    	("Date_validity_end_Common__c": item.Bis as Date {format: "yyyy-MM-dd"} as String {format: "yyyyMMdd"}) if (!isEmpty(item.Bis) and (item.Bis as String != "9999-12-31")),
    	"ALIA_TIPO_TATIFFA__C": item.Tarifart
	}
