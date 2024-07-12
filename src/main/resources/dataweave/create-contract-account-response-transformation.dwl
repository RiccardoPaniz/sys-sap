%dw 2.0
output application/json skipNullOn="everywhere"
---
{
	"ALIA_ContractAccountAddressId__c" : vars.accountAddress.AddressID,
	"ALIA_OLDKEY__c" : payload.ContractAccountID,
	"ALIA_OPBUK__c" : payload.ALIA_OPBUK__c,
	"ALIA_EZAWE__c" : payload.IncomingPaymentMethodID,
	"ALIA_AZAWE__c" : payload.OutgoingPaymentMethodID1,
	"ALIA_MAHNV__c" : payload.Mahnv,
	"ALIA_ZAHLKOND__c" : payload.Zahlkond,
	"ALIA_VERTYP__c" : payload.Vertyp,
	"ALIA_KOFIZ_SD__c" : payload.AccountDeterminationFeature,
	"ALIA_BUPLA__c" : payload.BusinessLocation,
	"ALIA_BKVID__c" : vars.bankAccount.BankAccountID,
	"ALIA_SHIPPING_ADDRESS_ID__c" : vars.accountAddress.AddressID
}





