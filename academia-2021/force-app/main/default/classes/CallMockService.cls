/***
 * Sebastián Marroquín 
 **/
global class CallMockService implements HttpCalloutMock {
    private String body;
    //Build the constructor
    global CallMockService (String body){
        this.body = body;
    }
    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setBody(this.body);
        response.setStatusCode(200);
        return response;
    }
}