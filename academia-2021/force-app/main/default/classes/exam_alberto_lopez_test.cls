//Alberto Daniel López Quezada
@IsTest
public class exam_alberto_lopez_test {
    
    public testMethod static void pruebaPost(){
        wrapperExam_alberto_lopez wEA = new wrapperExam_alberto_lopez();
        wEA.accountName = 'cuenta';
        wEA.BillingStreet = 'calle';
        wEA.Phone = '449';
        wEA.oppName = 'BL';
        wEA.StageName = 'Prospecting';
        exam_alberto_lopez.InsertaOpp(wEA);
    }
    
    public testMethod static void ConsultarGanador_Test(){
        Test.setMock(HttpCalloutMock.class, new callMock_exam_alberto_lopez());
        //exam_alberto_lopez eAl = new exam_alberto_lopez();
    	//eAl.ConsultarGanador();
        exam_alberto_lopez.ConsultarGanador();
    }
    
    public testMethod static void scheduleBatchoppsSinPagar(){

        Examen_alberto_lopez_BatchoppsSinPagar AB = new Examen_alberto_lopez_BatchoppsSinPagar();
            DataBase.executeBatch(AB);
	}
    
}