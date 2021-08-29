public without Sharing class BorrarCuentasNoPagadas implements Database.Batchable<sObject> {

    	
    //Se formula la busqueda
    public Database.QueryLocator start(Database.BatchableContext bc) {
    	final String CP = 'Closed Lost';
    	Return Database.getQueryLocator('SELECT ID, Closedate FROM OPPORTUNITY WHERE Closedate=Next_N_DAYS:2 AND StageName =\''+CP+'\'');
    }
    
    //Se decide Que hacer
    public void execute(Database.BatchableContext bc, List<Opportunity> Opps){
    	Database.delete(Opps);
    }
    
    //Que Hacemos al finalizar
    public void finish(Database.BatchableContext bc){
    	System.debug('Las Oportunidades no pagadas han sido eliminadas.');
    }
    
}