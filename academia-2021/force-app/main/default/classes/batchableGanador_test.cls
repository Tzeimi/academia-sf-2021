//BRISEIDY TORRES
@istest
public class batchableGanador_test {
	
    @testSetup
    public  static void setupData(){
          test.startTest();
        DataFactorySorteo.crearOpps();
       
        test.stoptest();
    }
    
    public static testMethod void batch_test()
    {
        string body = '{"NumeroGandor":{"folio":"BL-12345","Fecha":"12-12-21"}}';
        
        Test.setMock(HttpCalloutMock.class,new callWebServiceMock(body) );
        Ganador.callWebService();
        
        batchableGanador b = new batchableGanador();
        Database.executeBatch(b);
        
        scheduleBatchGanador s= new scheduleBatchGanador();
        
        String sch = '0 0 0 L * ? *';
        system.schedule('Schedule Ganador', sch, s);
    }
}