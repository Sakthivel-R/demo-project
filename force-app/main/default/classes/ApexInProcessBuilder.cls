public class ApexInProcessBuilder {
    @InvocableMethod
    //Process On Account Apex is process Builder 
    Public Static Void UpdateAccountName(List<Id> ids)
    {
        List<Account> AccountToBeUpdated = New List<Account>();
        
        List<Account> accounts= [Select Name FROM Account WHERE Id in :ids];
        
        for(Account acc:accounts){
            acc.Name = acc.Name + 'processbuilder test';
             AccountToBeUpdated.add(acc);
        }
        update AccountToBeUpdated;
    }
}