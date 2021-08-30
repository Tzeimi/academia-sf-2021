global class ConsultaGanadorProgramado implements Schedulable {
    
    global void execute(SchedulableContext ctx) {      
        VentaRest.consultarGanador();      
    }
    
    global static void programarConsultaGanador(){
		ConsultaGanadorProgramado cgp  = new ConsultaGanadorProgramado();
        String sch = '00 59 23 L * ?';
        //String sch = '00 08 20 29 * ?';
        system.schedule('Ganador del Sorteo del Mes', sch, cgp);
    }
}