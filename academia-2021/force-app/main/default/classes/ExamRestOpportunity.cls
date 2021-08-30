/***
 * Sebastián Marroquín 
 **/
global class ExamRestOpportunity {
    global void callWebService(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://b4f5e369-e6c1-405c-9089-ab013f277ad5.mock.pstmn.io/Ganador');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // Response is Ok
        if(response.getStatusCode() == 200) {
            // JSON Deserializable
            WrapperCliente boletoGanador = (WrapperCliente) JSON.deserializeStrict(response.getBody(), WrapperCliente.class);
            List<Opportunity> opp = [
                SELECT Name 
                FROM Opportunity 
                WHERE Name = :boletoGanador.NumeroGandor.folio
            ];
            for(Opportunity opptny : opp){
                // Replace StageName = closed won aka winner
                if(opptny.Name == 'BL-12345'){
                    opptny.StageName = 'Closed Won';
                    System.debug('Felicidades, eres el ganador de la loteria.');
                    // Update
                    Update opptny;
                }else{
                    System.debug('Este no es el boleto ganador :( ');
                }
            }
        // Bad response
        }else{
            System.debug(response.getStatus());
        }
    }
}