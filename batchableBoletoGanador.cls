public class batchableBoletoGanador implements Database.Batchable<sObject> {

public Database.QueryLocator start(Database.BatchableContext bc) {
String Query='SELECT ID,Name FROM opportunity';
return Database.getQueryLocator(query);
}
public void execute(Database.BatchableContext bc, list<opportunity> ganador){
for(opportunity opp : ganador){
    
 Integer numberOfDays = Date.daysInMonth(system.today().year(), system.today().month());
 Date lastDayOfMonth = Date.newInstance(system.today().year(), system.today().month(), numberOfDays);   
    
    if(system.today() == lastDayOfMonth){
        
       restVenta.getGanador();
        
    }
    
}
update ganador;
}
public void finish(Database.BatchableContext bc){
System.debug('La insercion del Boleto Ganador Fue Exitosa');
}
}