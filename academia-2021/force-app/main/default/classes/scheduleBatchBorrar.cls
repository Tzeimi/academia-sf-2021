//BRISEIDY TORRES
global class scheduleBatchBorrar  implements Schedulable {
	 global void execute(SchedulableContext ctx){
            batchableSorteo b = new batchableSorteo();
        Database.executeBatch(b);
     }
 
}