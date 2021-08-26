public class OppsMay7Years_albertdanl {

    Public OppsMay7Years_albertdanl(){
    //Tenemos un Objeto Buro
    Opportunity[] Opps7years = new Opportunity[]{};
    //Se busca cuenta con antiguedad mayor LAST_N_DAYS:Dias LAST_N_Months: MEses LAST_N_YEARS:Años 3
    Opportunity[] opps = [SELECT Id,Name,AccountId FROM Opportunity WHERE CreatedDate <> LAST_N_YEARS:7 And (StageName <> 'Closed Won' or StageName <> 'Closed Lost')];
    //Iteramos por cada Oportunidad
    for(Opportunity opp : opps){
   		Opps7years.Add(opp);
    }
    //Y creamos los registros
    delete Opps7years;
    }
}