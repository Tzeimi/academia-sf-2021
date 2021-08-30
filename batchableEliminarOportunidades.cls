public class batchableEliminarOportunidades implements Database.Batchable<sObject> {

public Database.QueryLocator start(Database.BatchableContext bc) {
String Query= 'Select id, closedate FROM Opportunity ';
return Database.getQueryLocator(query);
}
public void execute(Database.BatchableContext bc, List<opportunity> queryBorrar){
    list<opportunity> oppBorrar = new list<opportunity>() ;     
    
    for(opportunity o : queryBorrar){
         Date lastTwoDays = Date.newInstance(o.CloseDate.year(), o.CloseDate.month(), o.CloseDate.day() -2 ); 
        if(lastTwoDays.isSameDay(system.today())   && o.StageName == 'Closed lost' )
        {
            oppBorrar.add(o);            
        }    
    
    }
database.delete(oppBorrar);
}
public void finish(Database.BatchableContext bc){
System.debug('el borrado de las oportunidades fue exitoso');
}
}