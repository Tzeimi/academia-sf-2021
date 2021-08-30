trigger sendEmail on Opportunity (before insert) {
    //AQUI se detona el email cuando se crea la oportunidad...
	Email se = new Email();
   	for(Opportunity opp : Trigger.new){  
        se.Email(opp);
	}
}