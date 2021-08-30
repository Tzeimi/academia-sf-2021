@isTest
public class batchableEliminarOportunidadesTest {
    
    @testSetup
    public  static void oppTest(){
        test.startTest();
        datafactory.crearOportunidad();
        test.stoptest();
    }
    
    public static testmethod void batEliminarOpp (){
          batchableEliminarOportunidades bat = new batchableEliminarOportunidades();
          Database.executeBatch(bat);
        
       tareaBatchEliminarOportunidades t = new tareaBatchEliminarOportunidades();
       String sch = '0 0 0 * * ? *';
	   system.schedule('Eliminar Oportunidades', sch, t);
            
    }  
        
    
    
    

}