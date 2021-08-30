global class LlamadaAMock implements HttpCalloutMock {
    private String body;
    global LlamadaAMock(String body){
        this.body = body;
    }
    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setBody(this.body);
        response.setStatusCode(200);
        return response;
    }
}