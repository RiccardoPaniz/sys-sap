%dw 2.0
output application/java
---
{
  "AccountID" : vars.contractAccount.AccountID,
  "AddressInfo" : {
    "City" : vars.contractAccount.ALIA_ShippingCity__c,
    ("PostalCode" : vars.contractAccount.ALIA_ShippingPostalCode__c) if (vars.contractAccount.ALIA_ShippingPostalCode__c != null),
    "Street" : vars.contractAccount.ALIA_ShippingStreet__c,
    ("Floor" : vars.contractAccount.ALIA_Shipping_Floor__c) if (vars.contractAccount.ALIA_Shipping_Floor__c != null),
    ("RoomNo" : vars.contractAccount.ALIA_Shipping_ROOMNUMBER__c) if (vars.contractAccount.ALIA_Shipping_ROOMNUMBER__c != null),
    ("HouseNo" : vars.contractAccount.ALIA_ShippingHouseNumber__c) if (vars.contractAccount.ALIA_ShippingHouseNumber__c != null),
    ("HouseNo2" : vars.contractAccount.ALIA_ShippingHouseNumber2__c) if (vars.contractAccount.ALIA_ShippingHouseNumber2__c != null),
    "CountryID" : vars.contractAccount.ALIA_ShippingNationCode__c,
    ("Region" : vars.contractAccount.ALIA_ShippingStateCode__c) if (vars.contractAccount.ALIA_ShippingStateCode__c != null),
    ("Building" : vars.contractAccount.ALIA_SHIPPING_STR_SUPPL3__c) if (vars.contractAccount.ALIA_SHIPPING_STR_SUPPL3__c != null),
    ("District": vars.contractAccount.ALIA_Shipping_LOCATION__c) if (vars.contractAccount.ALIA_Shipping_LOCATION__c != null)
  }
/*  
  ,
  "AccountAddressUsages" : [
  	{
	    "AddressType" : "BILL_TO"
  	}
  ]

  */
}
