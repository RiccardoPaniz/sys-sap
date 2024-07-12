%dw 2.0
output application/json
---
{
	"Id" : payload.Id,
	"ALIA_OLDKEY__c" : vars.sapResult.BusinessPartner,
	"ALIA_BILLING_ADDRESS_ID__c" : vars.sapResult.to_BusinessPartnerAddress[0].AddressID
}

