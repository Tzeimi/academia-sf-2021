//BRISEIDY TORRES
public class Ganador {
 public static void callWebService(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://b4f5e369-e6c1-405c-9089-ab013f277ad5.mock.pstmn.io/Ganador');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
        wrapperGanador ganador = (wrapperGanador)JSON.deserializeStrict(response.getBody(),wrapperGanador.class);
        Opportunity opp = [select id,name from opportunity where name =: ganador.NumeroGandor.folio];
        opp.StageName = 'Closed Won';
        Database.update(opp);
        }
 }
}