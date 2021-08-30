@RESTResource(URLMapping='/restventa')

global with sharing class restVenta {

    @HTTPPost
    global static String JSONParam(WrapperSale cliente){
        system.debug(cliente);
        
        
        Account acc = new Account(name=cliente.nombre,Phone=cliente.telefono); 
        acc.BillingStreet = cliente.direccion;
        insert acc;

        Opportunity opp = new Opportunity();
        opp.AccountId = acc.Id;
        opp.Name = cliente.nombreOportunidad;
        opp.CloseDate= cliente.fechaSorteo;
        opp.StageName=cliente.status;
        insert opp;
     return 'la operacion se ha realizado con exito';  
        
    }  
    
 
    global void getGanador(){    	 
    Http http = new Http();
	HttpRequest request = new HttpRequest();
	request.setEndpoint('https://b4f5e369-e6c1-405c-9089-ab013f277ad5.mock.pstmn.io/Ganador');
	request.setMethod('GET');
	HttpResponse response = http.send(request);
	// If the request is successful, parse the JSON response.
	if(response.getStatusCode() == 200) {
		// Deserialize the JSON string into collections of primitive data types.
     wrapperGanador boletoGanador = (wrapperGanador) JSON.deserializeStrict(response.getBody(),wrapperGanador.class);
                       System.debug(boletoGanador);
        
        opportunity opp = [select id, name from opportunity where name =: boletoGanador.NumeroGandor.folio ];
        opp.stageName = 'Closed won';
        database.update(opp);
    	}
     
    }
    
    
    
    
    
}