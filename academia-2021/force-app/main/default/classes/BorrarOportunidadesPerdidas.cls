global class BorrarOportunidadesPerdidas implements Schedulable{
     
    global void execute(SchedulableContext ctx) {     
         
        List<Opportunity> oportunidades=[Select id, closedate FROM Opportunity WHERE Closedate=Next_N_DAYS:2 AND StageName='Closed Lost'];
        for(Opportunity o: oportunidades){            
            system.debug(o);                      
        }    
        delete oportunidades;  
    }    
    global static void programarBorrarOportunidadesPerdidas(){
        BorrarOportunidadesPerdidas bop = new BorrarOportunidadesPerdidas();
        String sch = '00 22 21 * * ?';		
        system.schedule('Borrar Oportunidades No pagadas', sch, bop);
    }


}