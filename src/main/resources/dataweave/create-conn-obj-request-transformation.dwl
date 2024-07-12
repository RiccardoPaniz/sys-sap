%dw 2.0
output application/java

---
{
  ("Begru" : payload.ALIA_BEGRU__c) if (payload.ALIA_BEGRU__c != null),
  ("City1" : payload.ALIA_CITY1__c) if (payload.ALIA_CITY1__c != null),
//  ("City2" : payload.ALIA_CITY1__c) if (payload.ALIA_CITY1__c != null),
  ("Street" : payload.ALIA_STREET__c) if (payload.ALIA_STREET__c != null),
  ("HouseNum1" : payload.ALIA_HOUSE_NUM1__c) if (payload.ALIA_HOUSE_NUM1__c != null),
  ("HouseNum2" : payload.ALIA_HOUSE_NUM2_CONNOBJ__c) if (payload.ALIA_HOUSE_NUM2_CONNOBJ__c != null),
  ("HouseNum3" : payload.ALIA_HOUSE_NUM3__c) if (payload.ALIA_HOUSE_NUM3__c != null),
  ("PostCode1" : payload.ALIA_POST_CODE1__c) if (payload.ALIA_POST_CODE1__c != null),
  "Country" : "IT"
}
