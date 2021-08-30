/***
 * Sebastián Marroquín
 * */
global class DeleteTickets implements Schedulable {
    global static void execute(System.SchedulableContext sc){
        DeleteUnpaidAccounts delAcc = new DeleteUnpaidAccounts();
        Database.executeBatch(delAcc);
    }
    
    /***
     * To activate the task, do this:
     * Debug --> Open Execute Anonymous --> Insert the following
     * ApexSchedule as = new ApexSchedule();
     * String schedule = '0 0 23 * * ?';
     * String job = System.schedule('Delete unpaid account from system', schedule, as);
     * */
}