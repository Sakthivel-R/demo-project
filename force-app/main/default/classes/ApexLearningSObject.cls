public class ApexLearningSObject {
        public void Sobjectdemo(){
            
        	/* specific Sobject
        	Account acc= new Account();
        	acc.Name= 'Test';
        	acc.Phone= '12334567';
        	System.debug('Account =' +acc);*/
            
            // generic Sobject
            Sobject obj1=new Account(Name='Test');
            Account Acc=(Account)obj1;
            System.debug('Account ='+acc);
            
            //we dont create S object for every time ,one time is 
            //enough again again again we use the obj name in the program
            
            obj1 = new Contact(phone = '1234');
            
			airplane__c air=new airplane__c();
            air.Name='Test';
            System.debug('airline__c = '+air);

    }

}