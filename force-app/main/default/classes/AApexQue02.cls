public class AApexQue02 implements Queueable {
		// aqueueable is declare as class we can use it also in another queueable class also
		// queueable is interface so execute important method
		// 
		// execute by System.Enqueuejob(New AApexQue02());
		// 
		// we also get execute id of the class by save the string nameforstring= Systam.Enqueuejob(New AApexQue02);
		// ..then system.debug(nameforstring);  then   in search box => jobs=>apexjob paste the finded id you know the 
		// ... status
		// it can't handel million of records in one time
		
    Private List<Account> createcontact;
    
    public AApexQue02(List<Account> accountFromTrigger){
        this.createcontact = accountFromTrigger;
    }
		
    public 	Void execute(QueueableContext qcont){
        
        List<Contact> toInsert = New List<Contact>();
        for(Account acc:createcontact){
            contact con=New Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            toInsert.add(con);
        }
        if(!toInsert.isEmpty()){
            Insert toInsert;
        }
      
    }
}