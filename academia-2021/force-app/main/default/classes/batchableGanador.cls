//BRISEIDY TORRES
public class batchableGanador implements Database.Batchable<sObject> {
    
  
    public Database.QueryLocator start(Database.BatchableContext bc){
       	
        String Query =  'select id from opportunity';
        return Database.getQueryLocator(Query);
    }
    
  
    public void execute(Database.BatchableContext bc,List<Opportunity> records){
        
        
        Integer numberOfDays = Date.daysInMonth(system.today().year(), system.today().month());
        Date lastDayOfMonth = Date.newInstance(system.today().year(), system.today().month(), numberOfDays);

        if(system.today() == lastDayOfMonth)
           {
                Ganador.callWebService();
           }
      
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Se ejecuto la tarea para encontrar al ganador');
    }
}