%dw 2.0
output application/java
---
{
  ("AccountID" : vars.contractAccount.AccountID) if (vars.contractAccount.AccountID != null),
  ("Description" : vars.contractAccount.ALIA_VKBEZ__c) if (vars.contractAccount.ALIA_VKBEZ__c != null),  
  ("Opbuk" : vars.contractAccount.ALIA_OPBUK__c) if (vars.contractAccount.ALIA_OPBUK__c != null),
//commento valorizzazione campo "IncomingPaymentMethodID" da SF a SAP per TASK W-000879 [NTT] [MS] CR AMS - Modifica catena contrattuale - rimozione valorizzazione IncomingPaymentMethodID 
//("IncomingPaymentMethodID" : vars.contractAccount.ALIA_EZAWE__c) if (vars.contractAccount.ALIA_EZAWE__c != null),
  ("OutgoingPaymentMethodID1" : vars.contractAccount.ALIA_AZAWE__c) if (vars.contractAccount.ALIA_AZAWE__c != null),
  ("Mahnv" : vars.contractAccount.ALIA_MAHNV__c) if (vars.contractAccount.ALIA_MAHNV__c != null),
  ("BillToAccountID" : vars.contractAccount.BillToAccountID) if (vars.contractAccount.BillToAccountID != null),
  ("BillToAccountAddressID" :
   	if (vars.contractAccount.ALIA_SHIPPING_ADDRESS_ID__c == null) vars.accountAddress.AddressID else vars.contractAccount.ALIA_SHIPPING_ADDRESS_ID__c)
  	if (!isEmpty(vars.accountAddress.AddressID) or !isEmpty(vars.contractAccount.ALIA_SHIPPING_ADDRESS_ID__c)),
  ("AuthorizationGroup" : vars.contractAccount.ALIA_BEGRU__c) if (vars.contractAccount.ALIA_BEGRU__c != null),
  (Zahlkond : vars.contractAccount.ALIA_ZAHLKOND__c) if (vars.contractAccount.ALIA_ZAHLKOND__c != null),
  ("Vertyp" : vars.contractAccount.ALIA_VERTYP__c) if (vars.contractAccount.ALIA_VERTYP__c != null),
  ("AccountDeterminationFeature" : vars.contractAccount.ALIA_KOFIZ_SD__c) if (vars.contractAccount.ALIA_KOFIZ_SD__c != null),
  ("AccountClass" : vars.contractAccount.ALIA_KTOKL__c) if (vars.contractAccount.ALIA_KTOKL__c != null),
  ("BusinessLocation" : vars.contractAccount.ALIA_BUPLA__c) if (vars.contractAccount.ALIA_BUPLA__c != null),
  "SendcontrolGp" : if (vars.contractAccount.Send_via_Email__c == true and (vars.contractAccount.ALIA_ICOM_SMTP_VERSTATUS_1__c == "verification_ok" or vars.contractAccount.ALIA_ICOM_SMTP_VERSTATUS_1__c == "verification_not_sync")) (
  						if (vars.contractAccount.ALIA_ICOM_SMTP_REMARK_1__c == "PEC") "0002" else "0003"
  					)
  					else "0001",
  ("OutgoingPaymentBankAccountID" : vars.bankAccount.BankAccountID) if (vars.bankAccount.BankAccountID != null),
  ("AccountAddressID" :
  	if (vars.contractAccount.ALIA_SHIPPING_ADDRESS_ID__c == null) vars.accountAddress.AddressID else vars.contractAccount.ALIA_SHIPPING_ADDRESS_ID__c)
  	if (!isEmpty(vars.accountAddress.AddressID) or !isEmpty(vars.contractAccount.ALIA_SHIPPING_ADDRESS_ID__c)),
  ("InterestKey" : vars.contractAccount.ALIA_INTEREST_KEY__c) if (!isEmpty(vars.contractAccount.ALIA_INTEREST_KEY__c))
  
}
