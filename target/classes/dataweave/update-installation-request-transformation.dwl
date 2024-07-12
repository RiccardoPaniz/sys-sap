%dw 2.0
output application/json skipNullOn="everywhere"
---
{
  "InstallationID" : vars.installation.ALIA_OLDKEY_Instl__c,
//  "PremiseID" : vars.installation.ALIA_VSTELLE__c,
//  "DivisionID" : "RF",
//  "Anlart": vars.installation.ALIA_ANLART__c,
  "Tariftyp": vars.installation.ALIA_TARIFTYP__c,
  "Ableinh": vars.installation.ALIA_ABLEINH__c,
//  "Bergu" : vars.installation.ALIA_BEGRU_Premise__c,
//  "Zzcodragg" : payload.ALIA_ZZCODRAGG__c,
  ("Ab" : vars.installation.ALIA_AB__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (!isEmpty(vars.installation.ALIA_AB__c)),
  ("Bis" : vars.installation.ALIA_BIS__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (!isEmpty(vars.installation.ALIA_BIS__c)),
//  "Aklasse" :  "RF00"
}