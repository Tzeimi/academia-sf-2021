public class WrapperBoletoGanador {  
    
    public NumeroGandor NumeroGandor{get;set;}    
    public class NumeroGandor{         
        public String folio{get;set;}  
    	public Date Fecha{get;set;}       
    }    
}
/*---- JSON ----
     * {"NumeroGandor":{"folio":"BL-12345","Fecha":"12-12-21"}}
     */