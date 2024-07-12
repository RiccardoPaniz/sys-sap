%dw 2.0
output application/java
---
{
  "ContractID" : payload.ALIA_OLDKEY__c,
//  ("VERTRAG" : payload.ALIA_OLDKEY__c) if (!isEmpty(payload.ALIA_OLDKEY__c))
  ("Kofiz" : payload.ALIA_KOZIF__c) if (!isEmpty(payload.ALIA_KOZIF__c)),
  ("Gemfakt" : payload.ALIA_GEMFCAT__c) if (!isEmpty(payload.ALIA_GEMFCAT__c)),
  ("Description" : payload.ALIA_VBEZ__c) if (!isEmpty(payload.ALIA_VBEZ__c)),
  ("Vrefer" : payload.ALIA_VREFER__c) if (!isEmpty(payload.ALIA_VREFER__c)),
  ("Begru" : payload.ALIA_BEGRU__c) if (!isEmpty(payload.ALIA_BEGRU__c)),
  ("PremiseID" : payload.PremiseID) if (!isEmpty(payload.PremiseID)),
  ("Anlage" : payload.Anlage) if (!isEmpty(payload.Anlage)),
  ("ContractAccountID" : payload.ContractAccountID) if (!isEmpty(payload.ContractAccountID)),
  "MoveInDate" : if (isEmpty(payload.ALIA_EINZDAT__c)) null else (payload.ALIA_EINZDAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'),
  "MoveOutDate" : if (isEmpty(payload.ALIA_AUSZDAT__c)) null else (payload.ALIA_AUSZDAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'),
  ("Cokey" : payload.ALIA_COKEY__c) if (!isEmpty(payload.ALIA_COKEY__c)),
  ("Zaccodass" : payload.ALIA_ZZACCODASS__c) if (!isEmpty(payload.ALIA_ZZACCODASS__c)),
  //("Zzacdtblr" : (payload.ALIA_ZZACDTBLR__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00')) if (!isEmpty(payload.ALIA_ZZACDTBLR__c)),
  "Zzconfcat" : if (payload.ALIA_ZZCONFCAT__c == true) "X" else " ",
  ("Abrsperr" : payload.ALIA_ABRSPERR__c) if (!isEmpty(payload.ALIA_ABRSPERR__c)),
  ("Bukrs" : payload.ALIA_BUKRS__c) if (!isEmpty(payload.ALIA_BUKRS__c != null)),
  ("Zzmotcess": payload.ALIA_MotivoCessazione__c) if (!isEmpty(payload.ALIA_MotivoCessazione__c)),
  ("Zzmotcess": payload.ALIA_MotivoCessazioneContratto__c) if (!isEmpty(payload.ALIA_MotivoCessazioneContratto__c) and isEmpty(payload.ALIA_MotivoCessazione__c))
}