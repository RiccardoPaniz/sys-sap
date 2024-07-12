%dw 2.0
output application/json

fun formatDate(str: String): String = (if (isEmpty(str)) "9999-12-31T00:00:00" else str as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ "T00:00:00")

---
{
	"Devloc" : payload.ALIA_DEVLOC__c,
	("Kunde" : payload.AccountID) if(payload.AccountID != null),
	"Anlage" : payload.ALIA_OLDKEY_Instl__c,
//  "Matr" : payload.ALIA_ZMATR__c,
	"Eadat" : if (payload.Action == "01")
  				formatDate(payload.ALIA_ASSIGNMENT_START_DATE__c default "")
		    else if (payload.Action == "02") 
  				formatDate(payload.ALIA_ASSIGNMENT_END_DATE__c default "")
  			else formatDate(""),
//	"Tag" : payload.ALIA_ZTAG__c,
	"Action" : payload.Action,
	("Equnrneu" : payload.ALIA_EQUNR__c) if (payload.Action == "01"),
	("Equnralt" : payload.ALIA_EQUNR__c) if (payload.Action == "02"),
//  "Gpart" : payload.ALIA_GPART__c
	("Lgort" : payload.ALIA_LOGORT__c) if (payload.Action == "01"),
	("Auldt" : payload.ALIA_AULDT__c) if (payload.Action == "01"),
	("Ezeit" : payload.ALIA_EZEIT__c) if (payload.Action == "01"),
}