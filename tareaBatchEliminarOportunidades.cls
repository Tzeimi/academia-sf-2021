global class tareaBatchEliminarOportunidades implements Schedulable {
    global void execute(SchedulableContext ctx) {
        batchableEliminarOportunidades bc;
        DataBase.executeBatch(bc);
    }
}