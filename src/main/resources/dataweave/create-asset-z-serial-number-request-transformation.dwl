%dw 2.0
output application/java

var tax = [
  	({
      ("BusinessPartner" : payload.ALIA_BPEXT__c) if (payload.ALIA_BPEXT__c != null),
      "BPTaxType" : "IT4",
      "BPTaxNumber": payload.ALIA_TAXNUM_PIVA_IT0__c,
      "BPTaxLongNumber" : payload.ALIA_TAXNUM_PIVA_IT0__c,
    }) if (payload.ALIA_TAXNUM_PIVA_IT0__c != null),
  	({
      ("BusinessPartner" : payload.ALIA_BPEXT__c) if (payload.ALIA_BPEXT__c != null),
      "BPTaxType" : "ITCF",
      "BPTaxNumber": payload.ALIA_TAXNUM_PIVA_IT1__c,
      "BPTaxLongNumber" : payload.ALIA_TAXNUM_PIVA_IT1__c,
    }) if (payload.ALIA_TAXNUM_PIVA_IT1__c != null),
  	({
      ("BusinessPartner" : payload.ALIA_BPEXT__c) if (payload.ALIA_BPEXT__c != null),
      "BPTaxType" : "ITCF",
      "BPTaxNumber": payload.ALIA_TAXNUM_CF__c,
      "BPTaxLongNumber" : payload.ALIA_TAXNUM_CF__c,
    }) if (payload.ALIA_TAXNUM_CF__c != null)
]

var email = [
	({
       "IsDefaultEmailAddress" : true,
       "EmailAddress" : payload.ALIA_ICOM_SMTP_ADDR_1__c,
       "SearchEmailAddress" : payload.ALIA_ICOM_SMTP_ADDR_1__c
    }) if (payload.ALIA_ICOM_SMTP_ADDR_1__c != null),
	({
       "IsDefaultEmailAddress" : false,
       "EmailAddress" : payload.ALIA_ICOM_SMTP_ADDR_2__c,
       "SearchEmailAddress" : payload.ALIA_ICOM_SMTP_ADDR_2__c
    }) if (payload.ALIA_ICOM_SMTP_ADDR_2__c != null)
]

var mobile = [
    ({
       "IsDefaultPhoneNumber" : if (payload.ALIA_ICOM_TEL_MOBILE_1__c == "3") true else false,
       "InternationalPhoneNumber" : payload.Phone,
        ("PhoneNumberType" : payload.ALIA_ICOM_TEL_MOBILE_1__c) if (payload.ALIA_ICOM_TEL_MOBILE_1__c != null)
    }) if (payload.Phone != null),
    ({
       "IsDefaultPhoneNumber" : if (payload.ALIA_ICOM_TEL_MOBILE_2__c == "3") true else false,
       "InternationalPhoneNumber" : payload.ALIA_ICOM_TEL_NUMBER_2__c,
       ("PhoneNumberType" : payload.ALIA_ICOM_TEL_MOBILE_2__c) if (payload.ALIA_ICOM_TEL_MOBILE_2__c != null)
    }) if (payload.ALIA_ICOM_TEL_NUMBER_2__c != null)
]

var addresses = [
  	{
      ("CityName" : payload.BillingCity) if (payload.BillingCity != null),
      ("PostalCode" : payload.BillingPostalCode) if (payload.BillingPostalCode != null),
      ("StreetName": payload.BillingStreet) if (payload.BillingStreet != null),
      ("Country" : payload.BillingCountryCode) if (payload.BillingCountryCode != null),
      ("Region" : payload.BillingStateCode) if (payload.BillingStateCode != null),
      ("AdditionalStreetSuffixName" : payload.ALIA_BILLING_LOCATION__c) if (payload.ALIA_BILLING_LOCATION__c != null),
      ("FLOOR" : payload.ALIA_BILLING_FLOOR__c) if (payload.ALIA_BILLING_FLOOR__c != null),
      ("RoomNumber" : payload.ALIA_BILLING_ROOMNUMBER__c) if (payload.ALIA_BILLING_ROOMNUMBER__c != null),
      ("StreetSuffixName" : payload.ALIA_BILLING_STR_SUPPL3__c) if (payload.ALIA_BILLING_STR_SUPPL3__c != null),
      ("to_EmailAddress" : email) if (email != []),
      ("to_MobilePhoneNumber" : mobile) if (mobile != [])
    }
]

---
{
  "BusinessPartnerCategory": "1",
  "BusinessPartnerIDByExtSystem" : payload.Id,  
  ("CreationDate" : payload.ALIA_VALID_FROM_1__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_VALID_FROM_1__c != null), 
  ("FormOfAddress" : payload.ALIA_TITLE__c) if (payload.ALIA_TITLE__c != null),
  ("BusinessPartnerFullName" : payload.title) if (payload.title != null),
  ("LegalForm" : payload.ALIA_LEGAL_ENTY__c) if (payload.ALIA_LEGAL_ENTY__c != null),
  ("OrganizationFoundationDate" : payload.ALIA_FOUND_DAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_FOUND_DAT__c != null),
  ("OrganizationLiquidationDate" : payload.ALIA_LIQUID_DAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_LIQUID_DAT__c != null),
  ("SearchTerm1" : payload.ALIA_BU_SORT_1__c) if (payload.ALIA_BU_SORT_1__c != null),
  ("SearchTerm2" : payload.ALIA_BU_SORT_2__c) if (payload.ALIA_BU_SORT_2__c != null),
//  ("FormOfAddress" : payload.Salutation) if (payload.Salutaion != null),
  ("LastName" : payload.LastName) if (payload.LastName != null),
  ("FirstName" : payload.FirstName) if (payload.FirstName != null),
  ("AcademicTitle" : payload.ALIA_TITLE_ACA1__c) if (payload.ALIA_TITLE_ACA1__c != null),
  ("IsMale" : true) if (payload.ALIA_Gender__c == "01"),
  ("IsFemale" : true) if (payload.ALIA_Gender__c == "02"),
  ("IsSexUnknow" : true) if (payload.ALIA_Gender__c == "03"),
  ("BirthDate" : payload.PersonBirthDate as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.PersonBirthDate != null),
  ("NameCountry": vars.businessPartner.ALIA_NATIO__c) if (vars.businessPartner.ALIA_NATIO__c != null),
/*
  ("BusinessPartnerBirthplaceName" : payload.ALIA_BIRTHPL__c) if (payload.ALIA_BIRTHPL__c != null),
  ("BusinessPartnerDeathDate" : payload.ALIA_DEATHDT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00') if (payload.ALIA_DEATHDT__c != null),
  ("BusinessPartnerBirthDateStatus" : payload.ALIA_MARST__c) if (payload.ALIA_MARST__c != null),
*/
  ("to_BusinessPartnerAddress" : addresses map (item, index) -> {
    "AddressTimeZone": "CET",
    (item)
  }) if (addresses != []),
  ("to_BusinessPartnerTax" : tax) if (tax != [])
}