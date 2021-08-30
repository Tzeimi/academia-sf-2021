//public 
global class scheduleBatch Implements Schedulable{
    Global static void execute(SchedulableContext sc){
        closedLost cl = new closedLost(); 
   		DataBase.executeBatch(cl);
    }
}