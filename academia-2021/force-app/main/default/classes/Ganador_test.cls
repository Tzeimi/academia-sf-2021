//BRISEIDY TORRES
@istest
public class Ganador_test {
	
    @testSetup
    public  static void setupData(){
          test.startTest();
        DataFactorySorteo.crearOpps();
       
        test.stoptest();
    }
    
    public testMethod static void callWebService_test(){
        string body = '{"NumeroGandor":{"folio":"BL-12345","Fecha":"12-12-21"}}';
        
        Test.setMock(HttpCalloutMock.class,new callWebServiceMock(body) );
        Ganador.callWebService();
        
        
    }
}