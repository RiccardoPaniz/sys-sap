%dw 2.0
output application/java
---
{
  ("City" : vars.contractAccount.ALIA_ShippingCity__c) if (vars.contractAccount.ALIA_ShippingCity__c != null),
  ("PostalCode" : vars.contractAccount.ALIA_ShippingPostalCode__c) if (vars.contractAccount.ALIA_ShippingPostalCode__c != null),
  ("Street" : vars.contractAccount.ALIA_ShippingStreet__c) if (vars.contractAccount.ALIA_ShippingStreet__c != null),
  ("Floor" : vars.contractAccount.ALIA_SHIPPING_FLOOR__c) if (vars.contractAccount.ALIA_SHIPPING_FLOOR__c != null),
  ("RoomNo" : vars.contractAccount.ALIA_Shipping_ROOMNUMBER__c) if (vars.contractAccount.ALIA_Shipping_ROOMNUMBER__c != null),
  ("CountryID" : vars.contractAccount.ALIA_ShippingNationCode__c) if (vars.contractAccount.ALIA_ShippingNationCode__c != null),
  ("Region" : vars.contractAccount.ALIA_ShippingStateCode__c) if (vars.contractAccount.ALIA_ShippingStateCode__c != null),
  ("Building" : vars.contractAccount.ALIA_SHIPPING_STR_SUPPL3__c) if (vars.contractAccount.ALIA_SHIPPING_STR_SUPPL3__c != null)
}
