//Alberto Daniel López Quezada
global class callMock_exam_alberto_lopez implements HttpCalloutMock{

    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setBody('{"NumeroGandor":{"folio":"BL-12345","Fecha":"12-12-21"}}');
        response.setStatusCode(200);
        return response;
    }
}