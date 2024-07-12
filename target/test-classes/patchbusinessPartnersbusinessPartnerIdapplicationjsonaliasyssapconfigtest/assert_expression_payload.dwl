%dw 2.0
import * from dw::test::Asserts
---
payload must equalTo({
  "BusinessPartnerRole": "MKK",
  "ValidTo": "9999-12-31T00:00:00",
  "BusinessPartner": "1001230629",
  "AuthorizationGroup": "",
  "ValidFrom": "2022-10-18T00:00:00",
  "ALIA_OLDKEY__c": "1001230629",
  "ALIA_BILLING_ADDRESS_ID__c": null
})