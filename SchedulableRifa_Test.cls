@IsTest
public class SchedulableRifa_Test {
    
     @isTest static void test() {
          Opportunity opp = new Opportunity();
        Test.startTest();
         opp.Name = 'BL-123';
         opp.CloseDate= Date.today().addDays(-5);
         opp.StageName='Close Lost';
         insert(opp);
        
        SchedulableRifa uca = new SchedulableRifa();
      System.schedule('test', '0 0 0 L-2 * ?', uca);
      
        Test.stopTest();
         
         
        // after the testing stops, assert records were updated properly
       // System.assert(10, [select count() from contact where MailingCity = 'New York']);
    }

}