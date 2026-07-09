public class ApexInvocableMethod {
    
   @InvocableMethod
    //by using this keyWord we use the methods in flow or process builder
    //but in flow we able to return value 
    //not in process builder
    Public Static List<String> returnAccountName(List<ID> ids) {
        List<String> AccountNames = New List<String>();
        
        List<Account> Acc=[Select Name FROM Account WHERE ID In :ids];
        
        for(Account ac:Acc){
            
            AccountNames.add(ac.Name);
        }
        
        return AccountNames;
    }

}