//Alberto Daniel López Quezada
//Parte del examen: 2 dias antes del sorteo salesforce borra todas las oportunidades que no han sido pagadas(Cerrada Perdida)
public without Sharing class Examen_alberto_lopez_BatchoppsSinPagar implements Database.Batchable<sObject> {


	public Database.QueryLocator start(Database.BatchableContext bc) {
	final String CP = 'Closed Lost';
	
	Return Database.getQueryLocator('SELECT Id,CloseDate FROM OPPORTUNITY WHERE StageName =\''+CP+'\' AND CloseDate = NEXT_N_DAYS:2 ');
	}

	public void execute(Database.BatchableContext bc, List<Opportunity> Opps){
	Database.delete(Opps);
	}

	public void finish(Database.BatchableContext bc){
	System.debug('Las Oportunidades sin pagar fueros Borradas Con Exito');
	}
}