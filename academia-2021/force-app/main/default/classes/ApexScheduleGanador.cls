Global class ApexScheduleGanador Implements Schedulable {
    Global static void execute(SchedulableContext sc){
        
        
        LoteriaRest.JSONParam();
        
        /*Metodo antiguo
        Integer numeroMes = System.Today().month();
        Integer numeroanio = System.Today().year();
        Integer numberOfDaysOfThisMonth = Date.daysInMonth(numeroAnio, numeroMes);       
        Integer numeroDiaActual = System.Today().day();
        
        if( numeroDiaActual ==  numberOfDaysOfThisMonth){
            LoteriaRest.JSONParam();
        }
		*/
    }

        
    /*
     * Para activar la tarea, lo hace una vez al mes
	ApexSchedule m = new ApexSchedule();
	String sch = '0 0 1 L * ? *';
	String jobID = system.schedule('Verificar el ganador', sch, m);
	*/
}