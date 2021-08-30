@IsTest
public class RestVentaTest {
public Static testMethod  void pruebaExitosa(){
string body ='{"NumeroGandor":{"folio":"BL-12345","Fecha":"12-12-21"}}';
Test.setMock(HttpCalloutMock.class, new callWebVentasMock(body));
restVenta rs = new restVenta();
rs.getGanador();
}
public testMethod Static void pruebaNoSatisfactoria(){
String Body = '{';
Body+=' "error": {';
Body+=' "name": "mockRequestNotFoundError",';
Body+=' "message": "Double check your method and the request path and try again.",';
Body+='"header": "No matching requests"';
Body+=' }';
Body+='}';
Test.setMock(HttpCalloutMock.class, new callErrorMock(Body));
restVenta rs = new restVenta();
rs.getGanador();
}
}