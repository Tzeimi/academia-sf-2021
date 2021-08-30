@RestResource(urlMapping='/Mirest')
global with sharing class BoletoRest {
    @HttpPost
    global static Account createAccount(wrapperBoleto account) {
        //Account[] acc = new Account[]{};
           Account ac =new Account();
           ac.Name=account.Name;
           ac.Phone=account.Phone;
           ac.BillingStreet = account.Address;
           insert(ac); 
        
          Opportunity opp = new Opportunity();
       
          opp.Name=account.NombreBL;
          opp.StageName=account.Stage;
          opp.CloseDate=account.DateLottery;
          opp.AccountId= ac.Id;
          insert(opp);
       EnviaCorreo(opp);
      //Database.insert(acc);
       // Database.insert(opps);
        return ac;
    }
    
    public static void EnviaCorreo(Opportunity opp){
        Contact c  =  new Contact(
        AccountId = opp.AccountId,
        FirstName = 'Julio',
        LastName ='MEdellin',   
        Email = 'julio.medellin@softtek.com');
        insert c;
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = new String[] { 'julio.medellin@softtek.com' };
message.optOutPolicy = 'FILTER';
message.subject = 'Subject Test Message';
message.plainTextBody = 'This is the message body.';
Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);

if (results[0].success) {
    System.debug('The email was sent successfully.');
} else {
    System.debug('The email failed to send: ' + results[0].errors[0].message);
}
}
    
    
}