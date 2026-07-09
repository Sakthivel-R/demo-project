public class apexsenario {
// create oppertinuity for every account created this year
// don't use dml inside the loop
// 
    public Static void createopp(){
        List<opportunity> opp=New List<opportunity>();
        
        for(Account acc:[Select id,name FROM Account WHERE CreatedDate=THIS_YEAR]){
            opportunity opp1=New opportunity();
            opp1.NAME=acc.name;
            opp1.CloseDate=System.today();
            opp1.AccountId=acc.Id;
            opp.add(opp1);
        }
        
        if(!opp.IsEmpty()){
            insert opp;
        }
    }
}