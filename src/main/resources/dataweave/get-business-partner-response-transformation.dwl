%dw 2.0
output application/json
---
vars.businessPartner ++
{
	"to_BusinessPartnerAddressPhoneNumber" : payload
}
