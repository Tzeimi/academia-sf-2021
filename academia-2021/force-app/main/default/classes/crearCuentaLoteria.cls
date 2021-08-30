@RestResource(urlMapping='/Account')
global with sharing class crearCuentaLoteria {
    
    @HTTPPost
    global static Id createAccount(Loteria cuenta) {
        Account restAcc = new Account();
        restAcc.Name = cuenta.Nombre;
        restAcc.ShippingStreet = cuenta.Direccion;
        restAcc.Phone = cuenta.Telefono;
        
		insert restAcc;
        
        Opportunity opp = new Opportunity();
        opp.AccountId = restAcc.Id;

        opp.Name = cuenta.NombreBoleto;
        opp.StageName = cuenta.Status;
        opp.CloseDate = cuenta.FechaSorteo;
        insert opp;
        
        Sendemail(opp);

        return restAcc.Id;
    }
     public static void SendEmail(Opportunity opp){
        Contact c  =  new Contact(
        AccountId = opp.AccountId,
             firstName = 'Paulo',
             lastName ='Rodriguez',
             Email = 'julio.medellin@softtek.com'); 
            insert c;
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setTargetObjectId(c.id);
                mail.setTemplateId('00X5e0000027pwxEAA');
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }
}