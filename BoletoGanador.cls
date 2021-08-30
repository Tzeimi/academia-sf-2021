public class BoletoGanador {
		public static void makeGetCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://b4f5e369-e6c1-405c-9089-ab013f277ad5.mock.pstmn.io/Ganador');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
           wrapperBoleto ganador = (wrapperBoleto) JSON.deserializeStrict(response.getBody(),wrapperBoleto.class);
           // List<Object> animals = (List<Object>) results.get('animals');
           Opportunity oop = [SELECT Name FROM Opportunity Where Name = :ganador.NumeroGandor.folio];
            oop.StageName = 'Closed Won';
            update oop;
          
            system.debug(response.getStatus());
        }
            
        
        }
        
}