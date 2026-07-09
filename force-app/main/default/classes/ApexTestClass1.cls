public class ApexTestClass1 {
    public Static void UpdateAccount(){
        List<account> accto=New List<Account>();
        Set<Id> accIdSet=New Set<Id>();
        
        for(Contact con : [Select Id,Account.ID FROM Contact
                          WHERE Name LIKE '%Test%'
                           And Account.Id !=NULL]){
                               if(!accIdSet.contains (con.Account.Id)){
                                   Account acc=new Account();
                                   acc.Id = con.Account.Id;
                                   acc.Active__c ='Yes';
                                   acc.Rating = 'Hot';
                                   accto.add(acc);
                                   accIdSet.add(con.Account.Id);
                                   
                                     
                               }
                           }
        if(!accto.isEmpty()){
            update accto;
        }
    }
}