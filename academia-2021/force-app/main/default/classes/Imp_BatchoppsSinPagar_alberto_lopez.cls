//Alberto Daniel López Quezada
//Parte del examen: 2 dias antes del sorteo salesforce borra todas las oportunidades que no han sido pagadas(Cerrada Perdida)
global class Imp_BatchoppsSinPagar_alberto_lopez Implements Schedulable {

    Global static void execute(SchedulableContext sc){
		Examen_alberto_lopez_BatchoppsSinPagar AB = new Examen_alberto_lopez_BatchoppsSinPagar();
		DataBase.executeBatch(AB);
	}
    
    //LEER:
    //Para programar este trabajo definimos la fecha con el siguiente codigo desde el execute anonymous window:
    //--> como el fin del sorteo es el 31 del 08 aplicaremos la eliminación los dias 29(2 dias antes):
   
    // Implements_BatchoppsSinPagar_alberto_lopez m = new Implements_BatchoppsSinPagar_alberto_lopez();
    // --> se implementara EL 29 DEL 8 del año--------------------------------------------------------------------
    // String sch='20 30 8 29 8 ?';
    // String jobID=System.schedule('eliminar los sin pagar', sch, m);
}