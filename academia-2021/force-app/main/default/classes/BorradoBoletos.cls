global class BorradoBoletos implements Schedulable {
    global void execute(SchedulableContext sc)
        {
            BoletosBr();
        }
 public static void BoletosBr(){
            Opportunity[] opportunityDel = [SELECT Name, CloseDate, StageName 
                                            FROM Opportunity 
                                            WHERE (CloseDate < 2021-08-27 AND StageName = 'Closed Lost')];
            delete opportunityDel;

    }
}