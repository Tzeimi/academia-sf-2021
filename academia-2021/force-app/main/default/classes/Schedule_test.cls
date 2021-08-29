@isTest
public class Schedule_test {
    
    public testMethod static void  testscheduleBorrarCuentas() {
    Test.StartTest();
    Opportunity opp = new Opportunity(Name='Borrar test name',CloseDate=system.today().addDays(-2));
    insert opp;
    ApexSchedule sh1 = new ApexSchedule();      
    String sch = '0 0 23 * * ?';
    system.schedule('Test check Borrar Cuentas', sch, sh1);
    Test.stopTest();
    
    }
    
    public testMethod static void  testscheduleBuscarGanador() {
   	String sch2 = '0 0 1 L * ? *';
   	String body ='{"NumeroGandor":{"folio":"BL-12345","Fecha":"12-12-21"}}';
    Test.setMock(HttpCalloutMock.class, new callBoletoGanadorMock(body));
    Test.StartTest();
    ApexScheduleGanador sh1 = new ApexScheduleGanador();      

    system.schedule('Test check Buscar Ganador', sch2, sh1);
    Test.stopTest();
    
    }

}