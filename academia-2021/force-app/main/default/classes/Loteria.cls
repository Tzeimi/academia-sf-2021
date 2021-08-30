global class Loteria {

	global string Nombre{get;set;}
	global string Direccion{get;set;}
	global string Telefono{get;set;} 
    
        global string NombreBoleto{get;set;} 
        global date FechaSorteo{get;set;} 
        global string Status{get;set;} 
    
            global NumeroGandor NumeroGandor; 
            global class NumeroGandor {
            global Date Fecha {get;set;}
            global String folio {get;set;}
    }
    
	
}