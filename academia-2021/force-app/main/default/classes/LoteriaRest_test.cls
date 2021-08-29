@Istest
public class LoteriaRest_test {

    public testMethod static void boletoComprado_test(){
        wrapBoleto wB = new wrapBoleto();
        wB.direccion = 'Mock Address';
        wb.nombre = 'Mock user';
        wb.numeroBoleto = '00000';
        wb.telefono = '0000000000';
        
        system.assertEquals('ok',LoteriaRest.boletoComprado(wb));
    }
    
    public testMethod Static void pruebaExitosa(){
    string body ='{"NumeroGandor":{"folio":"BL-12345","Fecha":"12-12-21"}}';
    Test.setMock(HttpCalloutMock.class, new callBoletoGanadorMock(body));
    LoteriaRest.JSONParam();
    }
    
    public testMethod static void triggerTest(){
      	Account acct = new Account(Name='Test Account');
       	insert acct;
        Test.startTest();

       	Opportunity opp = new Opportunity(Name=acct.Name + ' Opportunity',
                                        StageName='Prospecting',
                                       	CloseDate=System.today().addMonths(1),
                                       	AccountId=acct.Id);
        insert opp;
        Contact c = [SELECT Id,Name,AccountId FROM Contact where AccountId = : opp.AccountId]; 
        System.assertEquals(acct.Id,c.AccountId);
        Test.stopTest();        
    }
    
    public testMethod static void  testscheduleBorrarCuentas() {
        Test.StartTest();
       	Opportunity opp = new Opportunity(Name='Borrar test name',CloseDate=system.today().addDays(2),StageName='Closed Lost');
    	insert opp;
        ApexSchedule sh1 = new ApexSchedule();      
        String sch = '0 0 23 * * ?';
        system.schedule('Test check Borrar Cuentas', sch, sh1);
        Test.stopTest();
    
    }
}