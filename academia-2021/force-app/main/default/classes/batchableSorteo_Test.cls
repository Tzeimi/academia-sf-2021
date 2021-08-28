//BRISEIDY TORRES
@istest
public class batchableSorteo_Test {
	
    @testSetup
    public  static void setupData(){
          test.startTest();
        DataFactorySorteo.crearoppsBatchSorteo();
       
        test.stoptest();
    }
    
    public static testMethod void batch_test()
    {
   
        batchableSorteo b = new batchableSorteo();
        Database.executeBatch(b);
        
        scheduleBatchBorrar s= new scheduleBatchBorrar();
        
       String sch = '0 0 0 * * ? *';
	   system.schedule('Schedule Ganador', sch, s);
    }
}