Global class ApexSchedule Implements Schedulable {
    Global static void execute(SchedulableContext sc){
        
        
        BorrarCuentasNoPagadas AB = new BorrarCuentasNoPagadas();
    	DataBase.executeBatch(AB);
        
        /*Separado en otra clase
        Integer numeroMes = System.Today().month();
        Integer numeroanio = System.Today().year();
        Integer numberOfDaysOfThisMonth = Date.daysInMonth(numeroAnio, numeroMes);       
        Integer numeroDiaActual = System.Today().day();
        
        if( numeroDiaActual ==  numberOfDaysOfThisMonth){
            LoteriaRest.JSONParam();
        }
		
        
    	BorrarCuentasNoPagadas AB = new BorrarCuentasNoPagadas();
    	DataBase.executeBatch(AB);
	*/
    }
    
    /*
     * Para activar la tarea, la hace cada dia a las 23:00hrs
	ApexSchedule m = new ApexSchedule();
	String sch = '0 0 23 * * ?';
	String jobID = system.schedule('Borrar Cuentas no Pagadas', sch, m);
	*/

}