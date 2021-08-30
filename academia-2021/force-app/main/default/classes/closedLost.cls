public without Sharing class closedLost implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext db) {
    	Return Database.getQueryLocator('SELECT ID, Closedate FROM OPPORTUNITY WHERE Closedate=Next_N_DAYS:2 AND StageName = Closed Lost');
    }

    public void execute(Database.BatchableContext db, List<Opportunity> Opps){
        //db.delete(Opps);
    	Database.delete(Opps);
    }
    
    public void finish(Database.BatchableContext db){
        System.debug('Eliminados');
    	System.debug('Se eliminaron los boletos no pagados');
    }
    
}