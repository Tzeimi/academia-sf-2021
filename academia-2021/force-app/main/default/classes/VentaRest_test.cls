//BRISEIDY TORRES
@istest
public class VentaRest_test {
	 public testMethod static void doPost_test()
     {
         
        wrapperAccount wr = new  wrapperAccount();
        wr.Nombre = 'Briseidy';
        wr.Direccion = 'Valle de las flores 431';
        wr.Telefono = '8112567765';
        wr.Oportunidad.Nombre = 'BL-011';
        wr.Oportunidad.FechaSorteo = Date.parse('27/08/2021');
        wr.Oportunidad.Status = 'Prospecting';
         
        system.assertEquals('Se ha generado correctamente el boleto',VentaRest.doPost(wr));
         
     }
        
       
    
}