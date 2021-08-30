@istest
public class restVentaPostTest{
	 public testMethod static void postTest()
     {

        wrapperSale wPrueba = new  wrapperSale();
        wPrueba.nombre = 'Test E';
        wPrueba.direccion = 'la pinta 3513';
        wPrueba.telefono = '023204605535';
        wPrueba.nombreOportunidad = 'BL-999';
        wPrueba.fechaSorteo = Date.valueOf('2021-08-29');
        wPrueba.Status = 'Needs Analysis';

        system.assertEquals('la operacion se ha realizado con exito',restVenta.JSONParam(wPrueba));

     }



}