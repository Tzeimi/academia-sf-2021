//BRISEIDY TORRES
global class scheduleBatchGanador implements Schedulable {
     global void execute(SchedulableContext ctx){
       batchableGanador b = new batchableGanador();
       Database.executeBatch(b);
    }

}