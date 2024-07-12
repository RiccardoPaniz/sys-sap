%dw 2.0
output application/json skipNullOn="everywhere"

---
{
  "Oldkey" : payload.ALIA_OLDKEY_Adr__c,
  "Street" : payload.ALIA_STREET__c,
  "HouseNum1" : payload.ALIA_HOUSE_NUM1__c,
  "HouseNum2" : payload.ALIA_HOUSE_NUM2_CONNOBJ__c,
  "HouseNum3" : payload.ALIA_HOUSE_NUM3__c,
  "Bergu" : payload.ALIA_BEGRU__c,
  "City1" : payload.ALIA_CITY1__c,
  "PostCode1" : payload.ALIA_POST_CODE1__c
}