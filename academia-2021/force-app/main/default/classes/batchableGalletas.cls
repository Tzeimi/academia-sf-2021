public class batchableGalletas implements Database.Batchable<sObject> {
    
   
    public Database.QueryLocator start(Database.BatchableContext bc){
        
       string cw = 'Closed Won';
        string cl = 'Closed Lost';
       string query = 'SELECT Name, CloseDate,StageName FROM Opportunity WHERE (CloseDate = LAST_N_YEARS:7 AND (StageName =:cw OR StageName =:cl ))';
        return Database.getQueryLocator(query);
    }
    
    //el parametro list contact si se puede modificar 
    public void execute(Database.BatchableContext bc,List<Opportunity> records){
        
         delete records;
    }
    public void finish(Database.BatchableContext bc){
       system.debug('se han eliminado las oportunidades ');
    }

}