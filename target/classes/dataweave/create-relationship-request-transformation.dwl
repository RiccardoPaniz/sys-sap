%dw 2.0
output application/java
---
{
	("Businesspartnercompany" : payload.accounts[0].ALIA_OLDKEY__c) if (payload.accounts[0].ALIA_OLDKEY__c != null),
    ("Businesspartnerperson" : payload.accounts[1].ALIA_OLDKEY__c) if (payload.accounts[1].ALIA_OLDKEY__c != null),
    "Validityenddate" : if (payload.relationship.EndDate == null) "9999-12-31T00:00:00" else (payload.relationship.EndDate as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'),
    "Validitystartdate" : if (payload.relationship.StartDate == null) "9999-12-31T00:00:00" else (payload.relationship.StartDate as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') ,
    "Isstandardrelationship" : false,
    ("Relationshipcategory" : payload.relationship.ALIA_Role__c) if (payload.relationship.ALIA_Role__c != null)
}


