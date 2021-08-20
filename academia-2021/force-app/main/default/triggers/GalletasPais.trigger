trigger GalletasPais on Opportunity (before insert) {
    
    HandlerOpportunity.venta(Trigger.new);
    
}