//BRISEIDY TORRES
global class wrapperAccount {
    
    global wrapperAccount(){
        this.Oportunidad = new Oportunidad();
        
    }
    global string Nombre{get;set;}
    global string Direccion{get;set;}
    global string Telefono{get;set;}
    global Oportunidad Oportunidad{get;set;}
    global class Oportunidad{
        global string Nombre{get;set;}
        global Date FechaSorteo{get;set;}
        global string Status{get;set;}
    }
 
}