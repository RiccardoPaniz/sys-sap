%dw 2.0
output application/java

fun divideBy40(str: String): Array<String> =
    if (str == null) []
    else if (sizeOf(str) <= 40) [str]
    else [str[0 to 39]] ++ divideBy40(str[40 to -1])

var splittedName = if (payload.Name  == null) null else divideBy40(payload.Name)

var tax = [
  	({
      ("BusinessPartner" : payload.ALIA_BPEXT__c) if (payload.ALIA_BPEXT__c != null),
      "BPTaxType" : "IT0",
      "BPTaxNumber": payload.ALIA_TAXNUM_PIVA_IT0__c,
      "BPTaxLongNumber" : payload.ALIA_TAXNUM_PIVA_IT0__c,
//      "AuthorizationGroup" : payload.
    }) if (payload.ALIA_TAXNUM_PIVA_IT0__c != null),
  	({
      ("BusinessPartner" : payload.ALIA_BPEXT__c) if (payload.ALIA_BPEXT__c != null),
      "BPTaxType" : "IT1",
      "BPTaxNumber": payload.ALIA_TAXNUM_PIVA_IT1__c,
      "BPTaxLongNumber" : payload.ALIA_TAXNUM_PIVA_IT1__c,
//      "AuthorizationGroup" : payload.
    }) if (payload.ALIA_TAXNUM_PIVA_IT1__c != null),
  	({
      ("BusinessPartner" : payload.ALIA_BPEXT__c) if (payload.ALIA_BPEXT__c != null),
      "BPTaxType" : "ITCF",
      "BPTaxNumber": payload.ALIA_TAXNUM_CF__c,
      "BPTaxLongNumber" : payload.ALIA_TAXNUM_CF__c,
//      "AuthorizationGroup" : payload.
    }) if (payload.ALIA_TAXNUM_CF__c != null),
    ({
      ("BusinessPartner" : payload.ALIA_BPEXT__c) if (payload.ALIA_BPEXT__c != null),
      "BPTaxType" : "IT4",
      "BPTaxNumber": payload.ALIA_SDI_IPA__c,
      "BPTaxLongNumber" : payload.ALIA_SDI_IPA__c,
    }) if (payload.ALIA_SDI_IPA__c != null)
]

var email = [
	({
       "IsDefaultEmailAddress" : true,
       "EmailAddress" : payload.ALIA_ICOM_SMTP_ADDR_1__c,
       ("Remark" : payload.ALIA_ICOM_SMTP_REMARK_1__c) if (payload.ALIA_ICOM_SMTP_REMARK_1__c != null),       
//       "SearchEmailAddress" : payload.ALIA_ICOM_SMTP_ADDR_1__c
    }) if (payload.ALIA_ICOM_SMTP_ADDR_1__c != null),
	({
       "IsDefaultEmailAddress" : false,
       "EmailAddress" : payload.ALIA_ICOM_SMTP_ADDR_2__c,
       ("Remark" : payload.ALIA_ICOM_SMTP_REMARK_2__c) if (payload.ALIA_ICOM_SMTP_REMARK_2__c != null),       
//       "SearchEmailAddress" : payload.ALIA_ICOM_SMTP_ADDR_2__c
    }) if (payload.ALIA_ICOM_SMTP_ADDR_2__c != null)
]

var mobile = [
    ({
       "IsDefaultPhoneNumber" : if (payload.ALIA_ICOM_TEL_NUMBER_2__c == null or payload.ALIA_ICOM_TEL_MOBILE_1__c == "3") true else false,
       "PhoneNumber" : payload.Phone,
//       ("Remark" : payload.ALIA_ICOM_TEL_REMARK_1__c) if (payload.ALIA_ICOM_TEL_REMARK_1__c != null),
		"InternationalPhoneNumber" : if (vars.businessPartner.Phone == null) vars.businessPartner.ALIA_ICOM_TEL_NUMBER_2__c else vars.businessPartner.Phone,
//       ("PhoneNumberType" : payload.ALIA_ICOM_TEL_MOBILE_1__c) if (payload.ALIA_ICOM_TEL_MOBILE_1__c != null)
		("PhoneNumberType": "1") if (payload.ALIA_ICOM_TEL_TYPE_1__c == "x" or payload.ALIA_ICOM_TEL_TYPE_1__c == "X"),
		("PhoneNumberType": "2") if (payload.ALIA_ICOM_TEL_TYPE_1__c == "2"),
		("PhoneNumberType": "3") if (payload.ALIA_ICOM_TEL_NUMBER_2__c == null or payload.ALIA_ICOM_TEL_MOBILE_1__c == "3"),
    }) if (payload.Phone != null),
    ({
       "IsDefaultPhoneNumber" : if (payload.Phone == null or payload.ALIA_ICOM_TEL_MOBILE_2__c == "3") true else false,
       "PhoneNumber" : payload.ALIA_ICOM_TEL_NUMBER_2__c,
//       ("Remark" : payload.ALIA_ICOM_TEL_REMARK_2__c) if (payload.ALIA_ICOM_TEL_REMARK_2__c != null),
		"InternationalPhoneNumber" : if (vars.businessPartner.Phone == null) vars.businessPartner.ALIA_ICOM_TEL_NUMBER_2__c else vars.businessPartner.Phone,
//       ("PhoneNumberType" : payload.ALIA_ICOM_TEL_MOBILE_2__c) if (payload.ALIA_ICOM_TEL_MOBILE_2__c != null)
		("PhoneNumberType": "1") if (payload.ALIA_ICOM_TEL_TYPE_2__c == "x" or payload.ALIA_ICOM_TEL_TYPE_2__c == "X"),
		("PhoneNumberType": "2") if (payload.ALIA_ICOM_TEL_TYPE_2__c == "2"),
		("PhoneNumberType": "3") if (payload.Phone == null or payload.ALIA_ICOM_TEL_MOBILE_2__c == "3"),
    }) if (payload.ALIA_ICOM_TEL_NUMBER_2__c != null)
]

var addressUsage = [
	{
		"AddressUsage" : "XXDEFAULT"
	}
]

var addresses = [
  	{
      ("CityName" : payload.BillingCity) if (payload.BillingCity != null),
      ("PostalCode" : payload.BillingPostalCode) if (payload.BillingPostalCode != null),
      ("StreetName": payload.BillingStreet) if (payload.BillingStreet != null),
      "HouseNumber": payload.ALIA_BillingHouseNumber__c default "",
      ("Country" : payload.BillingCountryCode) if (payload.BillingCountryCode != null),
      ("Region" : payload.BillingStateCode) if (payload.BillingStateCode != null),
      ("AdditionalStreetSuffixName" : payload.ALIA_BILLING_LOCATION__c) if (payload.ALIA_BILLING_LOCATION__c != null),
//    ("FLOOR" : payload.ALIA_BILLING_FLOOR__c) if (payload.ALIA_BILLING_FLOOR__c != null),
      ("Floor" : payload.ALIA_BILLING_FLOOR__c) if (payload.ALIA_BILLING_FLOOR__c != null),
      ("RoomNumber" : payload.ALIA_BILLING_ROOMNUMBER__c) if (payload.ALIA_BILLING_ROOMNUMBER__c != null),
      ("StreetSuffixName" : payload.ALIA_BILLING_STR_SUPPL3__c) if (payload.ALIA_BILLING_STR_SUPPL3__c != null),
//      ("Remark" : payload.ALIA_BILLING_REMARK__c) if (payload.ALIA_BILLING_REMARK__c != null),       
      ("to_EmailAddress" : email) if (email != []),
      ("to_MobilePhoneNumber" : mobile) if (mobile != []),
      ("to_AddressUsage" : addressUsage),
      "HouseNumberSupplementText": payload.ALIA_BillingHouseNumber2__c default ""
    }
]

---
{
  "BusinessPartnerCategory": "1",
  ("BusinessPartner" : payload.ALIA_BPEXT__c) if (payload.ALIA_BPEXT__c != null),
  ("BusinessPartnerIDByExtSystem" : payload.ALIA_BPEXT__c) if (payload.ALIA_BPEXT__c != null),
  ("CreationDate" : payload.ALIA_VALID_FROM_1__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_VALID_FROM_1__c != null), 
  ("LegalForm" : payload.ALIA_LEGAL_ENTY__c) if (payload.ALIA_LEGAL_ENTY__c != null),
  ("OrganizationFoundationDate" : payload.ALIA_FOUND_DAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_FOUND_DAT__c != null),
  ("OrganizationLiquidationDate" : payload.ALIA_LIQUID_DAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_LIQUID_DAT__c != null),
  ("SearchTerm1" : payload.ALIA_BU_SORT1__c) if (payload.ALIA_BU_SORT1__c != null),
  ("SearchTerm2" : payload.ALIA_BU_SORT2__c) if (payload.ALIA_BU_SORT2__c != null),
//  ("FormOfAddress" : payload.Salutation) if (payload.Salutaion != null),
  ("FormOfAddress" : payload.ALIA_TITLE__c) if (payload.ALIA_TITLE__c != null),
  ("AcademicTitle" : payload.ALIA_TITLE_ACA1__c) if (payload.ALIA_TITLE_ACA1__c != null),
  ("IsMale" : true) if (payload.ALIA_GENDER__c == "01"),
  ("IsFemale" : true) if (payload.ALIA_GENDER__c == "02"),
  ("IsNaturalPerson": "s") if (payload.IsPersonAccount == true),
  ("IsNaturalPerson": "n") if (payload.IsPersonAccount == false),
  ("IsSexUnknown" : true) if (payload.ALIA_GENDER__c == "03"),
  ("BirthDate" : payload.PersonBirthdate as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.PersonBirthdate != null),
  ("NameCountry" : payload.ALIA_NATIO__c) if (payload.ALIA_NATIO__c != null),
  ("BusinessPartnerBirthplaceName" : payload.ALIA_BIRTHPL__c) if (payload.ALIA_BIRTHPL__c != null),
  ("BusinessPartnerDeathDate" : payload.ALIA_DEATHDT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_DEATHDT__c != null),
  ("BusPartMaritalStatus" : payload.ALIA_MARST__c) if (payload.ALIA_MARST__c != null),
  "BusinessPartnerGrouping" : "ISU1",
  ("BusinessPartnerCategory" : "1") if (payload.IsPersonAccount == true),
  ("BusinessPartnerCategory" : "2") if (payload.IsPersonAccount == false),  
  ("BusinessPartnerIsBlocked" : payload.ALIA_Account_Update_Blocked__c) if (payload.ALIA_Account_Update_Blocked__c != null),
  ("AdditionalLastName" : payload.MiddleName) if (payload.MiddleName != null),
  ("BusinessPartnerType" : "V001") if (payload.IsPersonAccount == true),
  ("BusinessPartnerType" : "V002") if (payload.IsPersonAccount == false),
  ("PersonFullName" : payload.Name) if (payload.IsPersonAccount == true),
  ("LegalEntityOfOrganization": "PA") if (payload.ALIA_PubblicaAmministrazione__c == true),
  ("to_BusinessPartnerRole": [
      {
        "BusinessPartnerRole" : "MKK",
        "ValidFrom" : now() as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00',
        "ValidTo" : "9999-12-31T00:00:00"
    }
  ]),
  ("to_BusinessPartnerAddress" : addresses map (item, index) -> {
    "AddressTimeZone": "CET",
    (item)
  }) if (addresses != []),
  ("to_BusinessPartnerTax" : tax) if (tax != [])
}
++
if (payload.IsPersonAccount == true)
{
  ("LastName" : payload.LastName) if (payload.LastName != null),
  ("FirstName" : payload.FirstName) if (payload.FirstName != null)
	
} else if (payload.Name != null) ({
  ("OrganizationBPName1" : splittedName[0]) if (splittedName[0] != null),  		
  ("OrganizationBPName2" : splittedName[1]) if (splittedName[1] != null),  		
  ("OrganizationBPName3" : splittedName[2]) if (splittedName[2] != null),  		
  ("OrganizationBPName4" : splittedName[3]) if (splittedName[3] != null)
}) else {}
