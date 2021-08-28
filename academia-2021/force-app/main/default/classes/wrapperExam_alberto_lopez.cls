//Alberto Daniel López Quezada
global class wrapperExam_alberto_lopez {

    global String accountName {get;set;}
    global String BillingStreet {get;set;}
    global String Phone {get;set;}
    global String oppName {get;set;}
    global Date fechasorteo {get;set;}
    global String StageName {get;set;}
    
    //para consultar ganador:
    global NumeroGandor NumeroGandor; 
    global class NumeroGandor {
        global Date Fecha {get;set;}
        global String folio {get;set;}
    }
}