public class OpportunityHandlerGalletasSaoPaulo {
    public static void validarPais(List<Opportunity> oppList){
        
        
        
        for(Opportunity opp: oppList){
           Account acc = [ SELECT Id,BillingCountry from Account where Id=: opp.AccountId];
            if(acc.BillingCountry == 'Sao Paulo'){
               
                opp.Amount = opp.Amount + (opp.Amount*0.05);
                
            }
        }
        
     
        
    }
}