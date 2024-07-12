%dw 2.0
output application/java
---
{
	"Sapkey" : payload.relationship.ALIA_RELNR_Ext__c,
    "Validuntildatenew" : if (payload.relationship.EndDate == null) "9999-12-31T00:00:00" else (payload.relationship.EndDate as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'),
    "Validfromdatenew" : if (payload.relationship.StartDate == null) "9999-12-31T00:00:00" else (payload.relationship.StartDate as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00')
//	"BusinessPartner1" : payload.relationship.BusinessPartnerCompany
//	"BusinessPartner2" : payload.relationship.BusinessPartnerPerson
}
