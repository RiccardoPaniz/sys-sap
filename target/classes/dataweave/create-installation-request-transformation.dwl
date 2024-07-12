%dw 2.0
output application/java
---
{
  "PremiseID" : payload.ALIA_OLDKEY_Premise__c,
  "DivisionID" : "RF", // payload.ALIA_SPARTE__c
  ("Tariftyp": payload.ALIA_TARIFTYP__c) if (payload.ALIA_TARIFTYP__c != null),
  ("Ableinh": payload.ALIA_ABLEINH__c) if (payload.ALIA_ABLEINH__c != null),
  ("Begru" : payload.ALIA_BEGRU__c) if (payload.ALIA_BEGRU__c != null),
//  ("Zzcodragg" : payload.ALIA_ZZCODRAGG__c) if (payload.ALIA_ZZCODRAGG__c != null),
//  ("Zzcodragg" : payload.ALIA_ZZCODRAGGH__c) if (payload.ALIA_ZZCODRAGGH__c != null),
  "Aklasse": "RF00",
}