public class AApexBatch implements DataBase.Batchable<SObject> {
    
    // “Database.QueryLocator
    //This approach first fetches all apples (parent records) and then fetches their related baskets (child records) in the execute method, which is more efficient in batch processing.
    //if recorrd have related records 
    //
    //DataBase.executeBatch(new AApexBatch(),1);
    //it is used for more records like 1m records and 50 m records in background	
    //only 5 batch jobs run at time
    //we can't call future method from batch
    
    //Public DataBase.QueryLocator or iterable<SObject> 
    //QueryLocator() and Iterable in BatchApex?" - The answer depends on your need,
    //.. if you want to run a batch on records that can be filtered by SOQL then 
    //..QueryLocator is preferable, but if records that you want to be processed by 
    //..batch cannot be filtered by SOQL then you will have to use Iterable
    Public DataBase.QueryLocator Start(DataBase.BatchableContext bc){
        //1M recodes -- 200 is ready
        return Database.getQueryLocator('Select Id,Name FROM Account');
    }
    
    Public Void Execute(DataBase.BatchableContext bc,List<Account> listFromStartMethod){
        //logic to process the records
        integer i=1;
        for(Account acc: listFromStartMethod){
            acc.Name='Batch Class'+i;
            i++;
        }
        Update listFromStartMethod;
    }
    
    Public Void Finish(DataBase.BatchableContext bc){
        //post process logic
        System.debug('@@ Batch job completed');
        // this is how you can chain
        DataBase.executeBatch(New AApexBatch01(),20);
    }

}