global class tareaBatchGanador implements Schedulable {
    global void execute(SchedulableContext ctx) {
        batchableBoletoGanador bc;
        DataBase.executeBatch(bc);
    }
}