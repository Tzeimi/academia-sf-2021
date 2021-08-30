@isTest
//public
global class boletoGandor implements HttpCalloutMock {
	private string body;
    global boletoGandor(string body){
    	this.body = body;
    }
    
    global HTTPResponse respond(HTTPRequest request) {
        
    	HttpResponse res = new HttpResponse();
    	res.setBody(this.body);
        /*if(response.setStatusCode(200)===true){
            return response;
        }*/
        res.setStatusCode(200);
    	return res;
    }
}