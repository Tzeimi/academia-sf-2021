/**
 * Sebastián Marroquín
 * */
public without Sharing class DeleteUnpaidAccounts Implements Database.Batchable<sObject> {
	// Start
    public Database.QueryLocator start(Database.BatchableContext bc){
        final String StageNameLike = 'Closed Lost';
        String query = 'SELECT Id, CloseDate FROM Opportunity WHERE CloseDate = Next_N_DAYS:2 AND StageName = \'' + StageNameLike + '\'';
        return Database.getQueryLocator(query);
    }  
	//  Execute
    public void execute(Database.BatchableContext bc, List<Opportunity> oppList){
        Database.delete(oppList);
    }
	//  Finish
    public void finish(Database.BatchableContext bc){
        // Simple message
        System.debug('Opportunities that have not been paid have been deleted.');
    }
}