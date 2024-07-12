%dw 2.0
import * from dw::core::Strings
output application/json
---
{
  ("AccountID" : vars.contractAccount.AccountID) if (vars.contractAccount.AccountID != null),
  "IBAN" : vars.contractAccount.ALIA_IBAN_Outbound__c,
  "ControlKey" : vars.contractAccount.ALIA_IBAN_Outbound__c[4],
  "CountryID" : substring(vars.contractAccount.ALIA_IBAN_Outbound__c, 0, 2)
}
