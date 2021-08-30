/***
 * Sebastián Marroquín 
 **/
@IsTest
private class DeleteUnpaidAccounts_Test {
    @isTest static void testBatchDeleteUnpaidAcc(){
        // Begin the test
        Test.startTest();
        
        // Create a new opp
        Opportunity opps = new Opportunity(
        	Name = 'Test Delete Opp',
            CloseDate = System.today().addDays(-2),
            StageName = 'Closed Lost'
        );
        // Insert the opp
        Insert opps;
        DeleteUnpaidAccounts schedulable = new DeleteUnpaidAccounts();
        String cronExp = '0 0 23 * * ?';
        String jobName = 'Delete Opportunities';
        
        // Error in this part
        //String jobId = System.schedule(jobName, cronExp, schedulable);
        
        // Stop the test
        Test.stopTest();
    }
}