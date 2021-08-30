# Classes & Triggers for the exam in Salesforce
##### Developed by: Sebastián Marroquín
-------------------------------------------

## 1.1 Create account and Opportunity
--------------------------------

This class is in charge of creating an account and associating an opportunity to the created account. In addition to that, the creation of a specific contact is also added in addition to sending an email.

```
@RestResource(urlMapping='/AccountInsert')
global with sharing class ExamCreateAccount {
    @HTTPPost
    global static Id createAccount(WrapperCliente CreateAccount) {
        // Create the account
        Account restAcc = new Account();
        restAcc.Name = CreateAccount.Nombre;
        restAcc.ShippingStreet = CreateAccount.Direccion;
        restAcc.Phone = CreateAccount.Telefono;
        insert restAcc;
        
        // Create the Opportunity
        Opportunity opp = new Opportunity();
        opp.AccountId = restAcc.Id;
		opp.Name = CreateAccount.NombreOportunidad;
        opp.StageName = CreateAccount.Status;
        opp.CloseDate = CreateAccount.FechaSorteo;
        insert opp;
        
        // Create the contact and Send Email
        SendEmail(opp);        
        
        // Return the Id in the WorkBench
        return restAcc.Id;
    }
    
    public static void SendEmail(Opportunity opp){
         Contact cnct  =  new Contact(
         	AccountId = opp.AccountId,
         	firstName = 'Julio',
         	lastName ='Medellin',
         	Email = 'julio.medellin@softtek.com'
         );

        insert cnct;
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTargetObjectId(cnct.id);
        String EmailId = '00X5e0000027qXUEAY';
        mail.setTemplateId(EmailId);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }

}
```

## 1.2 Wrapper Class

```
global class WrapperCliente {
    // Account
    global String Nombre {get;set;}
    global String Direccion {get; set;}
    global string Telefono {get; set;}
    
    // Oportunity
    global String NombreOportunidad {get; set;}
    global Date FechaSorteo {get; set;}
    global String Status {get; set;}
}
```

### 1.1.1 Create opportunities with trigger

```
trigger createOpportunityFromAccount on Account (after insert) {
    List<Opportunity> optyList=new List<Opportunity>();
    for(Account a:Trigger.new)
    {
        Opportunity opp=new Opportunity();
        opp.AccountId=a.id;
        opp.Name='Oportunidad de la cuenta';
        opp.StageName='Prospecting';
        opp.CloseDate=Date.toDay();
        optyList.add(opp);
    }
    insert optyList;
}
```

## 1.3 Rest Class Opportunity

```
public class ExamRestOpportunity {
    public void callWebService(){
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
```