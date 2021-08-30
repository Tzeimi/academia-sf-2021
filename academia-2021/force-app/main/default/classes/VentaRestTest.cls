@isTest
global class VentaRestTest {

    @isTest static void testJSONParam() {
        // Call the method to test
        WrapperVenta venta = new WrapperVenta();
        venta.Nombre ='Cuenta De Prueba';
        venta.Direccion = 'Direccion de Prueba';
        venta.NombreOportunidad = 'Oportunidad de Prueba';
        venta.Telefono = '2995512887';
        venta.FechaSorteo = Date.today();
        venta.Status = 'Prospecting';                
        
        VentaRest.JSONParam(venta);
        
        Account acc = [SELECT name,Phone,BillingAddress  From Account WHERE name='Cuenta De Prueba'];        
        system.assert(acc !=null);     
    }    
    
    @isTest static void testConsultarGanador() {
       
        Test.setMock(HttpCalloutMock.class, new VentaRestMock()); 
       
        Opportunity o = new Opportunity(name='BL-12345',StageName='Prospecting', CloseDate=date.today());
        insert o;
        
        VentaRest.consultarGanador();
       
    }   
    
}