%dw 2.0
output application/java
---
{
// ("ContractID" :  payload.ALIA_OLDKEY__c),
  ("Contractaccountid" : payload.ContractAccountID) if (!isEmpty(payload.ContractAccountID)),
  ("Sparte" : payload.ALIA_SPARTE__c) if (!isEmpty(payload.ALIA_SPARTE__c)),
  ("DataEvento" : payload.ALIA_EINZDAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (!isEmpty(payload.ALIA_EINZDAT__c)),
  ("DataPresentazione" : payload.ALIA_REQUESTDATE__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (!isEmpty(payload.ALIA_REQUESTDATE__c)),
//  ("Vstelle" : payload.ALIA_VSTELLE__c) if (!isEmpty(payload.ALIA_VSTELLE__c)),
  ("Vstelle" : payload.ALIA_OLDKEY_Premise__c) if (!isEmpty(payload.ALIA_OLDKEY_Premise__c)),
  ("Begru" : payload.ALIA_BEGRU__c) if (!isEmpty(payload.ALIA_BEGRU__c)),
  ("Tariftyp" : payload.ALIA_TARIFTYP__c) if (!isEmpty(payload.ALIA_TARIFTYP__c)),
  ("Ableinh" : payload.ALIA_ABLEINH__c) if (!isEmpty(payload.ALIA_ABLEINH__c)),
  ("VreferOrdinario" : payload.ALIA_VREFER__c) if (!isEmpty(payload.ALIA_VREFER__c)),
  "Aklasse" : "RF00",
  ("DataInizioCorr": payload.ALIA_CorrispettivoFromDate__c ++ 'T00:00:00') if(!isEmpty(payload.ALIA_CorrispettivoFromDate__c)),
  "TipoEvento": payload.ALIA_Event_Type__c,
  ("Zzmotatt" : payload.ALIA_MotivoAttivazione__c)if (!isEmpty(payload.ALIA_MotivoAttivazione__c)),
  ("ZzvertP": payload.ALIA_OLDKEY_abitazione__c) if(payload.ALIA_OLDKEY_abitazione__c != null)
  
}
