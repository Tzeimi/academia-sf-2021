@istest
public class restVentaPostTest{
	 public testMethod static void postTest()
     {

        wrapperSale wr = new  wrapperSale();
        wr.nombre = 'Evelyn';
        wr.direccion = 'la pinta 3513';
        wr.telefono = '023204605535';
        wr.nombreOportunidad = 'BL-999';
        wr.fechaSorteo = Date.parse('29/08/2021');
        wr.Status = 'Prospecting';

        system.assertEquals('la operacion se ha realizado con exito',restVenta.JSONParam(wr));

     }



}