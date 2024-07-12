%dw 2.0
import * from dw::core::Strings
output application/java
---
{
	"Vertrag" : payload.evasion.ALIA_VREFER__c,
	"Dataccert" : if (isEmpty(payload.evasion.ALIA_REQUESTDATE__c)) "9999-12-31T00:00:00" else (payload.evasion.ALIA_REQUESTDATE__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'),
	"Tipoevento" : payload.ordinary.ALIA_Event_Type__c,
	"Canaleacq" : payload.ordinary.ALIA_Channel__c,
	"Codpratica" : payload.ordinary.ALIA_Pratica__c,
	"Datinieff" : if (isEmpty(payload.evasion.ALIA_EINZDAT__c)) "9999-12-31T00:00:00" else (payload.evasion.ALIA_EINZDAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'),
	"Datfineff" : if (isEmpty(payload.evasion.ALIA_AUSZDAT__c)) "9999-12-31T00:00:00" else (payload.evasion.ALIA_AUSZDAT__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00'),
	"Datevento" : if (isEmpty(payload.evasion.ALIA_Event_Date_Ev__c)) "9999-12-31T00:00:00" else (payload.evasion.ALIA_Event_Date_Ev__c as Date {format: "yyyyMMdd"} as String {format: "yyyy-MM-dd"} ++ 'T00:00:00')
}
