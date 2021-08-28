//Alberto Daniel López Quezada
//Parte del examen: Al final del mes salesforce consulta al ganador para actualizar la oportunidad ganadora a Cerrada Ganada.
global class Schedule_consultarGanador_alberto_lopez Implements Schedulable {

     Global static void execute(SchedulableContext sc){
		exam_alberto_lopez.ConsultarGanador();
	}
    
     //LEER:
    //Para programar este trabajo definimos la fecha con el siguiente codigo desde el execute anonymous window:
    //--> como el fin del sorteo es el 31 del 08 aplicaremos la eliminación ese día:
    
    //Schedule_consultarGanador_alberto_lopez m = new Schedule_consultarGanador_alberto_lopez();
    //String sch='20 30 8 31 8 ?';
    //String jobID=System.schedule('eliminar los sin pagar', sch, m);
}