public class HandlerEnviarMail {
    
    public static void SendEmail(Opportunity[] opp)
    {   
        Contact c  =  new Contact(
        AccountId = opp[0].AccountID,
         firstNAme = 'Julio',
         lastName ='Medellin',
         Email = 'julio.medellin@sofftek.com');
        
        upsert c;
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		mail.setTargetObjectId(c.id);

 		//Obtener el id de esta counsulta ‘SELECT Id,Name FROM EmailTemplate LIMIT 1‘
      
		//ID TEMPLATE JULIO ----- 00X5f000000WNm0EAG
        mail.setTemplateId('00X5e0000027qRPEAY');
        //Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); 
   }
}