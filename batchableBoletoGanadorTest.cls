@isTest
public class batchableBoletoGanadorTest {
    
        
    @testSetup
    public  static void oppTest(){
        test.startTest();
        datafactory.crearOportunidad();
        test.stoptest();
    }

    public static testmethod void boletoGanadorTest(){
        
        String body = '{"NumeroGandor":{"folio":"BL-12345","Fecha":"12-12-21"}}';
        Test.setMock(HttpCalloutMock.class,new callWebVentasMock(body) );
        restVenta.getGanador();
         batchableBoletoGanador bat = new batchableBoletoGanador();
          Database.executeBatch(bat);
        
        tareaBatchGanador t = new tareaBatchGanador();
       String sch = '0 0 0 * * ? *';
	   system.schedule('Eliminar Oportunidades', sch, t);  
    }
    
    
}