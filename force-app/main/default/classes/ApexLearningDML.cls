public with sharing class ApexLearningDML {
   /* public void insert01(){
        ApexLearning__c app= new ApexLearning__c(Name='b',phone__c='123');
        insert app;
        System.debug('appids=>' +app.Ids__c);
    }*/
    
    /*PUBLIC VOID Update01(){
        
        Account acc=new Account();
        acc.Name='a';
        insert acc;
        acc=[Select Name , Phone From Account where Name='sakthi'];
        acc.Name='demo';
        update acc;
        
    }*/
    
    /*PUBLIC VOID Upsert01(){
        // upsert is used to both insert and update operation
        List<Account> acc=new List<Account>();
        Account acc2=new Account(Name='sakthi1',Phone='123');
        Account acc1=[Select Name,Phone From Account Where Name='demo'];
        acc1.Name='sakthi';
        acc.add(acc1);
        acc.add(acc2);
        upsert acc;
        
    }*/
    /*Public void Merge01(){
        //mergeacc is deleted and releated acc in mergeacc are reallocated to master account
        Account master=[Select Id,Name,Phone From Account Where Name='sakthi'];
        Account mergeacc=[Select Id,Name,Phone From Account Where Name='sakthi1'];
        Merge master mergeacc;
        
    }*/
    
    /*public void Delete01(){
        List<Account> acc=[Select Name,Id From Account Where Name='sakthi'];
        Delete acc;
    }*/
    
   /* Public void unDelete01(){
        List<Account> acc=[Select Name,Id From Account Where Name='sakthi'All Rows];
        unDelete acc;
    }*/
    
     public void Exception01(){
         try{
             Account acc=new Account();
             insert acc;
         }
         catch(DmlException e){
             System.debug('Error =>' +e.getMessage());
         }
    }
}