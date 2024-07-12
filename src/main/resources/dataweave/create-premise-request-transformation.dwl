%dw 2.0
output application/json skipNullOn="everywhere"
---
{
//  "PremiseID" : payload.ALIA_OLDKEY_Premise__c,
  "Haus" : payload.ALIA_OLDKEY_Adr__c,
  "HausNum2" : payload.ALIA_HOUSE_NUM2__c,
  "Lgzusatz": payload.ALIA_LGZUSATZ__c,
  "Begru" : payload.ALIA_BEGRU__c,
//  "Vstelle" : payload.ALIA_OLDKEY_Premise__c,
  "ZsezUrb" : payload.ALIA_ZSEZ_URB__c,
  "Zfoglio" : payload.ALIA_ZFOGLIO__c,
  "Zpart" : payload.ALIA_ZPART__c,
  "Zpartst" : payload.ALIA_ZPARTST__c,
  "Ztipopar" : payload.ALIA_ZTIPOPAR__c,
  "Zsubal" : payload.ALIA_ZSUBAL__c,
  "ZnoAcca" : payload.ALIA_ZNO_ACCA__c,
  "ZnoAccle" : payload.ALIA_ZNO_ACCLE__c,
  "Zziduab" : payload.ALIA_ZZIDUAB__c,
  "Zzukcivico" : payload.ALIA_ZZUKCIVICO__c,
  "Zzukregion" : payload.ALIA_ZZUKREGIONE__c,
}