global  without Sharing class SchedulableRifa implements Schedulable {
	
    global void execute(SchedulableContext ctx) {
        List<Opportunity> opptys = [SELECT Id, Name, CloseDate, StageName
            FROM Opportunity
            WHERE StageNAme = 'Close Lost' AND
            CloseDate < TODAY];
       
    }

}