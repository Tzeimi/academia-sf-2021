@istest
global class callWebVentasMock implements HttpCalloutMock{
    
  
    private string body;
    global callWebVentasMock(string body){
        this.body = body;
    }

    global HTTPResponse respond(HTTPRequest request){
        HttpResponse response = new HttpResponse();
        response.setBody(this.body);
        response.setStatusCode(200);
        return response;
    }


}