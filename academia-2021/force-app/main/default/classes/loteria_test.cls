@isTest
public class loteria_test {
	 public testMethod static void  borraCuentas() {
    Test.StartTest();
    Opportunity opp = new Opportunity(Name='Julio',CloseDate=system.today().addDays(-2));
    insert opp;
    
    Test.stopTest();
    
    }       
}