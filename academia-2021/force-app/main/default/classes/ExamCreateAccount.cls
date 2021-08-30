/***
 * Sebastián Marroquín 
 **/
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
         	//firstName = 'Julio',
         	//lastName ='Medellin',
         	//Email = 'julio.medellin@softtek.com'
         	firstName = 'Julian',
            lastName = 'Martinez',
            Email = 'sebasmarro10@gmail.com'
         );

        insert cnct;
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTargetObjectId(cnct.id);
        String EmailId = '00X5e0000027qXUEAY';
        mail.setTemplateId(EmailId);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }

}