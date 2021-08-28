//Alberto Daniel López Quezada
@RestResource(urlMapping='/sorteo')
global with sharing class exam_alberto_lopez {
    
    //Para insertar cuentas y opportunidades
    //JSON que te permite insertar en el post InsertarOpp: 
    /*{"datos" : 
      {
       "accountName" : "cuenta", 
       "BillingStreet" : "calle",
       "Phone" :  "449",
       "oppName" : "BL",
       "StageName":  "Prospecting"
      }
    } */
    @HttpPost
	global static void InsertaOpp(wrapperExam_alberto_lopez datos) {
        
        Account acc = new Account(Name=datos.accountName, BillingStreet=datos.BillingStreet, Phone=datos.Phone);
        insert acc;
        Opportunity opp = new Opportunity(Name=datos.oppName, AccountId=acc.Id, StageName=datos.StageName, CloseDate=Date.newInstance(2021, 08, 31));
        insert opp;
        
        //correo:
        Contact ns = new Contact(AccountId =acc.Id, Email='julio.medellin@softtek.com', FirstName='Julio', LastName='Medellin');
        insert ns;
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTargetObjectId(ns.id);
        
        // ID de mi template: 00X5e000000daUpEAI
        mail.setTemplateId('00X5e000000daUpEAI');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
        
	}
    
    //Para consultar ganador
    global static void ConsultarGanador(){
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://b4f5e369-e6c1-405c-9089-ab013f277ad5.mock.pstmn.io/Ganador');
		request.setMethod('GET');
		HttpResponse response = http.send(request);
		if(response.getStatusCode() == 200) {
			wrapperExam_alberto_lopez ganador = (wrapperExam_alberto_lopez) JSON.deserializeStrict(response.getBody(),wrapperExam_alberto_lopez.class);
            Opportunity op = [SELECT Name FROM Opportunity Where Name = :ganador.NumeroGandor.folio];
            op.StageName = 'Closed Won';
            update op;
		}
	}
}