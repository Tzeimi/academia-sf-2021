/***
 * Sebastián Marroquín 
 **/
global class WrapperCliente {
    // Account
    global String Nombre {get;set;}
    global String Direccion {get; set;}
    global string Telefono {get; set;}
    
    // Oportunity
    global String NombreOportunidad {get; set;}
    global Date FechaSorteo {get; set;}
    global String Status {get; set;}
    
    // Winning Ticket
    global NumeroGandor NumeroGandor;
    global class NumeroGandor{
        global Date Fecha {get; set;}
        global String folio {get; set;}
    }
}