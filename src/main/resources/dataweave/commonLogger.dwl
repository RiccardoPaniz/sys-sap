%dw 2.0

fun logger(log) =
{
	CorrelationId: log.correlationId,
	ApplicationName: log.app.name,
	ApplicationVersion: log.mule.version,
	ApplicationEnviroment: log.env,
	InfoMessage: {
		Status: log.status,
		Message: log.message,
		ContentPayload: log.payload
	}
}

fun error(log) =
{
	CorrelationId: log.correlationId,
	ApplicationName: log.app.name,
	ApplicationVersion: log.mule.version,
	ApplicationEnviroment: log.env,
	InfoMessage:
		if (log.error.errorMessage == null) {
			ErrorCode: log.errorCode default 500,
			ErrorDescription: log.error.description,
			ErrorOn: log.app.name
		} else
			log.error.errorMessage.payload.InfoMessage
}
