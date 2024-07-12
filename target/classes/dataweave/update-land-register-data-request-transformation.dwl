%dw 2.0
output application/java

---
{
  "Vstelle" : payload.ALIA_OLDKEY_Premise__c,
  "Tipo_Dip" : payload.ALIA_TIPO_DIP__c,  
  "Prog" : payload.ALIA_PROG__c,
  "Bis" : if (payload.ALIA_BIS__c == null) "9999-12-31T00:00:00" else payload.ALIA_BIS__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00',
  ("Ab" :  payload.ALIA_AB__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_AB__c != null),
  ("ZsezUrb" : payload.ALIA_ZSEZ_URB__c) if (payload.ALIA_ZSEZ_URB__c != null),
  ("Zfoglio" : payload.ALIA_ZFOGLIO__c) if (payload.ALIA_ZFOGLIO__c != null),
  ("Zpart" : payload.ALIA_ZPART__c) if (payload.ALIA_ZPART__c != null),
  ("Zpartst" : payload.ALIA_ZPARTST__c) if (payload.ALIA_ZPARTST__c != null),
  ("Ztipopar" : payload.ALIA_ZTIPOPAR__c) if (payload.ALIA_ZTIPOPAR__c != null),
  ("Zsubal" : payload.ALIA_ZSUBAL__c) if (payload.ALIA_ZSUBAL__c != null),
  ("ZnoAcca" : payload.ALIA_ZNO_ACCA__c) if (payload.ALIA_ZNO_ACCA__c != null),
  ("ZnoAccle" : payload.ALIA_ZNO_ACCLE__c) if (payload.ALIA_ZNO_ACCLE__c != null),
  ("Zvani" : payload.ALIA_ZVANI__c) if (payload.ALIA_ZVANI__c != null),
  ("Zcateg" : payload.ALIA_ZCATEG__c) if (payload.ALIA_ZCATEG__c != null),
  ("Zsupcat" : payload.ALIA_ZSUPCAT__c) if (payload.ALIA_ZSUPCAT__c != null),
  ("ZsupcatImp" : payload.ALIA_ZSUPCAT_IMP__c) if (payload.ALIA_ZSUPCAT_IMP__c != null)
}
