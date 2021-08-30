@istest
public class LlamadaAMock_test {
    public testMethod static void prueba(){
        
    string body ='{"NumeroGandor":{"folio":"BL-12345","Fecha":"12-12-21"}}';
        Test.setMock(HttpCalloutMock.class, new LlamadaAMock(body));
        GanadorBoleto restTest = new GanadorBoleto();
        restTest.callWebService();
    }
}