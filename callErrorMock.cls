global class callErrorMock  Implements HttpCalloutMock{
private String Body;

 global callErrorMock(String Body){
this.Body = Body;
}
global HTTPResponse respond(HTTPRequest request) {
HttpResponse response = new HttpResponse();
response.setBody(this.Body);
response.setStatusCode(400);
return response;
}
}