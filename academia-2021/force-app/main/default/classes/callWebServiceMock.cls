//BRISEIDY TORRES
@istest
global class callWebServiceMock implements HttpCalloutMock {
	
    private string body;
    global callWebServiceMock(string body){
        this.body = body;
    }
    
    global HTTPResponse respond(HTTPRequest request){
        HttpResponse response = new HttpResponse();
        response.setBody(this.body);
        response.setStatusCode(200);
        return response;
    }
}