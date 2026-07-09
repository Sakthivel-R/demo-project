public class AApexBatch01 implements DataBase.Batchable<SObject> {
    
    //DataBase.executeBatch(new AApexBatch(),1);
    //it is used for more records like 1m records and 50 m records in background	
    
    Public DataBase.QueryLocator Start(DataBase.BatchableContext bc){
        return Database.getQueryLocator('Select Id,LastName FROM Contact');
    }
    
    Public Void Execute(DataBase.BatchableContext bc,List<Contact> listFromStartMethod){
        for(Contact con: listFromStartMethod){
            
            Con.LastName='Batch Class'+con.LastName;
        }
        Update listFromStartMethod;
    }
    
    Public Void Finish(DataBase.BatchableContext bc){
        System.debug('@@ Batch job completed');
        
        
    }

}