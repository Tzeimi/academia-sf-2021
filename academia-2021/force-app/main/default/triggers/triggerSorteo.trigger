//BRISEIDY TORRES
trigger triggerSorteo on Opportunity (after insert) {
    if(Trigger.IsAfter && Trigger.IsInsert){
         OpportunityHandlerSorteo.crearContacto(trigger.new);
    }

}