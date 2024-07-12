%dw 2.0
output application/json
---
{
	"Id" : payload.relationship.Id, 
	"ALIA_RELNR__c" : vars.sapResult.Relationshipnumber,
	("ALIA_Role__c" : vars.sapResult.Relationshipcategory) if (!isEmpty(vars.sapResult.Relationshipcategory)),
    ("StartDate" : vars.sapResult.Validitystartdate as Date {format: "yyyy-MM-dd"} as String {format: "yyyyMMdd"}) if ((!isEmpty(vars.sapResult.Validitystartdate)) and (vars.sapResult.Validitystartdate as String != "9999-12-31")),
	("EndDate" : vars.sapResult.Validityenddate as Date {format: "yyyy-MM-dd"} as String {format: "yyyyMMdd"}) if ((!isEmpty(vars.sapResult.Validityenddate)) and (vars.sapResult.Validityenddate as String != "9999-12-31")),
    ("accounts" :
    	if (payload.accounts[1].IsPersonAccount == true) ([
    	{
    		"Id" : payload.accounts[0].Id,
    		("ALIA_OLDKEY__c" : vars.sapResult.Businesspartnercompany) if (!isEmpty(vars.sapResult.Businesspartnercompany))
    	},
    	{
    		"Id" : payload.accounts[1].Id,
    		("ALIA_OLDKEY__c" : vars.sapResult.Businesspartnerperson) if (!isEmpty(vars.sapResult.Businesspartnerperson))
    	}
    	]) else ([
    	{
    		"Id" : payload.accounts[1].Id,
    		("ALIA_OLDKEY__c" : vars.sapResult.Businesspartnercompany) if (!isEmpty(vars.sapResult.Businesspartnercompany))
    	},
    	{
    		"Id" : payload.accounts[0].Id,
    		("ALIA_OLDKEY__c" : vars.sapResult.Businesspartnerperson) if (!isEmpty(vars.sapResult.Businesspartnerperson))
    	} 
    	])
    ) if (!isEmpty(vars.sapResult.Businesspartnercompany) or !isEmpty(vars.sapResult.Businesspartnerperson))
}
