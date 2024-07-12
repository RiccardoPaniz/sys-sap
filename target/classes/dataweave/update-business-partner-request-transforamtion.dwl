%dw 2.0
output application/json
 
fun divideBy40(str: String): Array<String> =
    if (str == null) []
    else if (sizeOf(str) <= 40) [str]
    else [str[0 to 39]] ++ divideBy40(str[40 to -1])

var splittedName = if (vars.businessPartner.Name  == null) null else divideBy40(vars.businessPartner.Name)

---
{
  "BusinessPartner": vars.businessPartnerId,
//  "BusinessPartnerIDByExtSystem" : vars.businessPartner.Id,
  "CreationDate" : if (isEmpty(vars.businessPartner.ALIA_VALID_FROM_1__c)) null else (vars.businessPartner.ALIA_VALID_FROM_1__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'),
  "LegalForm" : vars.businessPartner.ALIA_LEGAL_ENTY__c,
  "OrganizationFoundationDate" : if (isEmpty(vars.businessPartner.ALIA_FOUND_DAT__c)) null else (vars.businessPartner.ALIA_FOUND_DAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'), 
  "OrganizationLiquidationDate" :  if (isEmpty(vars.businessPartner.ALIA_LIQUID_DAT__c9)) null else (vars.businessPartner.ALIA_LIQUID_DAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'),
  ("SearchTerm1" : vars.businessPartner.ALIA_BU_SORT1__c) if (!isEmpty(vars.businessPartner.ALIA_BU_SORT1__c)),
  ("SearchTerm2" : vars.businessPartner.ALIA_BU_SORT2__c) if (!isEmpty(vars.businessPartner.ALIA_BU_SORT2__c)),
  "AcademicTitle" : vars.businessPartner.ALIA_TITLE_ACA1__c,
  ("IsMale" : true) if (vars.businessPartner.ALIA_GENDER__c == "01"),
  ("IsFemale" : true) if (vars.businessPartner.ALIA_GENDER__c == "02"),
  ("IsSexUnknown" : true) if (vars.businessPartner.ALIA_GENDER__c == "03"),
  ("IsNaturalPerson": "s") if (vars.businessPartner.IsPersonAccount == true),
  ("IsNaturalPerson": "n") if (vars.businessPartner.IsPersonAccount == false),
  "BirthDate" :  if (isEmpty(vars.businessPartner.PersonBirthdate)) null else (vars.businessPartner.PersonBirthdate as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'),
  "NameCountry": vars.businessPartner.ALIA_NATIO__c,
  "BusinessPartnerBirthplaceName" : vars.businessPartner.ALIA_BIRTHPL__c,
  "BusinessPartnerDeathDate" :  if (isEmpty(vars.businessPartner.ALIA_DEATHDT__c)) null else (vars.businessPartner.ALIA_DEATHDT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'),
  "BusPartMaritalStatus" : vars.businessPartner.ALIA_MARST__c,
  ("BusinessPartnerCategory" : "1") if (vars.businessPartner.IsPersonAccount == true),
  ("BusinessPartnerCategory" : "2") if (vars.businessPartner.IsPersonAccount == false), 
 /* 
  
  ("BusinessPartnerCategory":   if (vars.businessPartner.BusinessPartnerCategory__c != null)
  								 vars.businessPartner.BusinessPartnerCategory__c
  							   else if (vars.businessPartner.IsPersonAccount == false) 
  							     "BusinessPartnerCategory" : "2" 
  							   else 
  							      null) if(vars.businessPartner.BusinessPartnerCategory__c != null or vars.businessPartner.IsPersonAccount == false),
  
  
  
  * */
   "AdditionalLastName" : vars.businessPartner.MiddleName,
  "BusinessPartnerIsBlocked" : vars.businessPartner.ALIA_Account_Update_Blocked__c,
  ("BusinessPartnerType" : "V001") if (vars.businessPartner.IsPersonAccount == true),
  ("BusinessPartnerType" : "V002") if (vars.businessPartner.IsPersonAccount == false),
  ("PersonFullName" : vars.businessPartner.Name) if (vars.businessPartner.IsPersonAccount == true),
  ("LegalEntityOfOrganization": "PA") if (vars.businessPartner.ALIA_PubblicaAmministrazione__c == true),
  
}
++
if (vars.businessPartner.IsPersonAccount == true)
{
  "LastName" : vars.businessPartner.LastName,
  "FirstName" : vars.businessPartner.FirstName,
  ("FormOfAddress" : vars.businessPartner.Salutation) if (!isEmpty(vars.businessPartner.Salutation))
} else (
  {
	("FormOfAddress" : vars.businessPartner.ALIA_TITLE__c) if (!isEmpty(vars.businessPartner.ALIA_TITLE__c)),
  } ++
  if (!isEmpty(vars.businessPartner.Name)) ({
    ("OrganizationBPName1" : splittedName[0]) if (splittedName[0] != null),
    ("OrganizationBPName2" : splittedName[1]) if (splittedName[1] != null),
    ("OrganizationBPName3" : splittedName[2]) if (splittedName[2] != null),
    ("OrganizationBPName4" : splittedName[3]) if (splittedName[3] != null)
   })
 else {}
)

