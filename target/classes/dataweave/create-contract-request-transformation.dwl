%dw 2.0
output application/java
---
{
// ("ContractID" :  payload.ALIA_OLDKEY__c),
  ("Kofiz" : payload.ALIA_KOZIF__c) if (payload.ALIA_KOZIF__c != null),
  ("Gemfakt" : payload.ALIA_GEMFCAT__c) if (payload.ALIA_GEMFCAT__c != null),
  ("Description" : payload.ALIA_VBEZ__c) if (payload.ALIA_VBEZ__c != null),
  "Vrefer" : payload.ALIA_VREFER__c,
  "Begru" : payload.ALIA_BEGRU__c,
  ("PremiseID" : payload.ALIA_OLDKEY_Premise__c) if (payload.ALIA_OLDKEY_Premise__c != null),
  ("Anlage" : payload.ALIA_OLDKEY_Instl__c) if (payload.ALIA_OLDKEY_Instl__c != null),
  ("ContractAccountID" : payload.ContractAccountID) if (payload.ContractAccountID != null),
  ("MoveInDate" : payload.ALIA_EINZDAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (!isEmpty(payload.ALIA_EINZDAT__c)),
  "MoveOutDate" : if (payload.ALIA_AUSZDAT__c == null) "9999-12-31T00:00:00" else (payload.ALIA_AUSZDAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'),
  ("Cokey" : payload.ALIA_COKEY__c) if (payload.ALIA_COKEY__c != null),
  ("Zaccodass" : payload.ALIA_ZZACCODASS__c) if (payload.ALIA_ZZACCODASS__c != null),
  //("Zzacdtblr" :  payload.ALIA_ZZACDTBLR__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (!isEmpty(payload.ALIA_ZZACDTBLR__c)),
  "Zzconfcat" : if (payload.ALIA_ZZCONFCAT__c == true) "X" else " ",
//  "Zzconfcat" : if (payload.ALIA_ZZCONFCAT__c == true) "1" else "0"
  ("Abrsperr" : payload.ALIA_ABRSPERR__c) if (payload.ALIA_ABRSPERR__c != null),
//  "Zzmotatt" : "AM"
  ("Zzmotatt" : payload.ALIA_MotivoAttivazione__c)if (!isEmpty(payload.ALIA_MotivoAttivazione__c)),
  ("Bukrs" : payload.ALIA_BUKRS__c) if (payload.ALIA_BUKRS__c != null),
  ("ZzvertP": payload.ALIA_OLDKEY_abitazione__c) if(payload.ALIA_OLDKEY_abitazione__c != null)
}

