%dw 2.0
output application/json skipNullOn="everywhere"
---
{
  "Vertrag" : payload.ContractID,	
  "Gpar" : payload.ALIA_Account__c,
  "Vkont" : payload.ALIA_ContractAccount__c,
  ("Tdate" : payload.ALIA_LOCKR_EndDate__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_LOCKR_EndDate__c != null),
  ("Fdate" : payload.ALIA_LOCKR_StartDate__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_LOCKR_StartDate__c != null),
  "Proid" : payload.ALIA_Catalog__c
}
