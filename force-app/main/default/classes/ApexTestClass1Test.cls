@isTest
public class ApexTestClass1Test {
    @istest
    //test.starttest
    //test.stoptest
    //only one start and stop in class allow
    //testVisible if the method is private we use this key word and access the method
    //@testSetUp
    //testUtilitu class
    private Static void testupdateAccount(){
        Account acc=new Account();
        acc.Name='Test Name';
        acc.Active__c= 'No';
        acc.Rating='Cold';
        insert acc;
        
        Contact con=new Contact();
        con.FirstName = 'Test';
        con.LastName = 'Tset';
        con.AccountId = acc.id;
        insert con;
        
        ApexTestClass1.UpdateAccount();
        
        Account updateAcc=[SELECT Id,Active__c,Rating FROM Account WHERE Id=:acc.id];
        System.assertEquals('Hot', updateAcc.Rating);
    }
}