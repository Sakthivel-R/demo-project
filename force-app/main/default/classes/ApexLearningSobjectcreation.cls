public class ApexLearningSobjectcreation {
    Public void Sobj(){
        Account acc=New Account(Name='sakthi2',Phone='12345');
    	//acc.Name='sakthi';
    	//acc.Phone='12345';
    	System.debug('Acc =>'+acc);
    }
    
    public void oblist(){
        List<Account> accList = new List<Account>();
        accList=[Select id,Name from Account Limit 2];
        System.debug('acclist =>' +accList);
    }
     public void oblistfo(){
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        accList=[Select id,Name from Account Limit 2];
         
         if(!accList.isEmpty()){
             for(Account acc:accList){
                 accIds.add(acc.id);
             }
         }
        System.debug('acclist =>' +accIds);
    }
}