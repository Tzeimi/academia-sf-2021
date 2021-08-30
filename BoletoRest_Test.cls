@IsTest
public class BoletoRest_Test {
    public testMethod static void createAccount_test(){
        wrapperBoleto wratest = new wrapperBoleto();
		
        wratest.Name = 'cuenta';
        wratest.Address= 'calle';
        wratest.Phone = '449';
        wratest.NombreBL = 'BL';
        wratest.Stage = 'Prospecting';
        wratest.DateLottery = Date.today();
        BoletoRest.createAccount(wratest);
        
      

}
}