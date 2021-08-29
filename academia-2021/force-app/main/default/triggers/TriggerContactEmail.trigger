trigger TriggerContactEmail on Opportunity (before insert) {
	SendEmail se = new SendEmail();
   	for(Opportunity opp : Trigger.new){  
        se.sendEmail(opp);
        //insert c;
       	
    }
}