%dw 2.0
output application/java

---
{
  "Vertrag" : payload.ContractID,
//  "Abrsperr" : payload.
  ("Gpart" : payload.AccountID) if (payload.AccountID != null),
  ("Vkont" : payload.ContractAccount) if (payload.ContractAccount != null),
  ("Tdate" : payload.ALIA_LOCKR_EndDate__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_LOCKR_EndDate__c != null),
  ("Fdate" : payload.ALIA_LOCKR_StartDate__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_LOCKR_StartDate__c != null),
  ("Proid" : payload.ALIA_PROID__c) if (payload.ALIA_PROID__c != null),
  "Lotyp" : "02"
}
