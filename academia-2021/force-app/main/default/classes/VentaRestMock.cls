@isTest
global class VentaRestMock implements HttpCalloutMock {
    
    global HTTPResponse respond(HTTPRequest request) { 
        HttpResponse response = new HttpResponse();
        //response.setHeader('Content-Type', 'application/json');
        response.setBody('{"NumeroGandor":{"folio":"BL-12345","Fecha":"12-12-21"}}');
        response.setStatusCode(200);
        return response;        
    }

}