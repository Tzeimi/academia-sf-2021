trigger OpportunityByRegion on Opportunity (before insert) {

   	
     ClaseShanghai.OpportunityByRegionShanghai(trigger.new);
     claseTokyo.mifuncion(trigger.new);
     OpportunityHandlerGalletasSaoPaulo.validarPais(trigger.new);    
    
}