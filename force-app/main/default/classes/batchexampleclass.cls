public with sharing class batchexampleclass implements Database.Batchable<Sobject>{
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQuerylocator('Select Id, Name from Account limit 6');
    }
    
    public void execute(Database.BatchableContext bc, List<Account> acc){
        List<Account> updd = new List<Account>();
        For(Account acc1:acc){
            Account acc2 = new Account(Name = acc1.Name + 'batch', Id = acc1.id);
            updd.add(acc2);
        }
        update updd;
    }
    
    public void finish(Database.BatchableContext bc){
        System.debug('finished');
    }

}