public class AApesScheduel Implements Schedulable{
    
    // Schedulabe apex Execute in TWO Ways 
    // 1.User Interface
    // 2.CRON Expression
    // 1
    //   User Interface    in search=>schedule job=>new schedule=> choose schedule apex
    // 
    // above is easy but we only declere hours 1am,4pm not able to mention min or sec 1.15pm
    // 2
    // ..so we use CRON expression it have 7 dig  '0 0 0 * * ? 2022' =12am every day in 2022
    // 
    // 		'SEC  MIN  HOUR  DAY-OF-THE-MONTH  MONTH     DAY-OF-WEEK YEAR /yera is optional'
    // 		'0-59 0-59  0-23     1-31,?,*  1-12 or JAN-DEC,?,*   1-7,SUN-SAT,*,?   ?,*,MENTION  
    // 		  '
    // 		* = all value   like above all the day in month
    // 		? = no value 
    // 		
    // 		DAY-OF-THE-MONTH and DAY-OF-WEEK not mention same time
    // 		String cro='12 30 13 ? 1 MON-WED 2024'  1.30.12pm in jan month monday to wenesday in 2024
    // DECLEAR System.schedule(jobName = any, cronExp =cro, schedulable = schedulable class)
    
    /*Public Void execute(SchedulableContext sc){
        List<Account> accs=[Select Id,Name FROM Account WHERE CreatedDate=Today];
        for(Account acc:accs){
            acc.Name='today Created'+acc.Name;
        }
        Update accs;
    }*/
    
    // we also call batch apex 
    
    
    Public Void execute(SchedulableContext sc){
        Database.executeBatch(New AApexBatch());
    }
    

}