//BRISEIDY TORRES
public class batchableSorteo implements Database.Batchable<sObject> {
    
  
    public Database.QueryLocator start(Database.BatchableContext bc){
       	string cl= 'Closed Lost';
        String Query =  'select Name,closedate, stageName from opportunity WHERE StageName =:cl ';
        return Database.getQueryLocator(Query);
    }
    
  
    public void execute(Database.BatchableContext bc,List<Opportunity> records){
        Opportunity[] lst = new Opportunity[]{};
        
        for(Opportunity opp: records){
            integer days = (system.today()).daysBetween(Date.valueOf(opp.CloseDate));

            if(days == 2 )
            {
                lst.add(opp);
            }
        } 
	Database.delete(lst);        
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Se elimino exitosamente todas las oportunidades con etapa Closed Lost');
    }
}