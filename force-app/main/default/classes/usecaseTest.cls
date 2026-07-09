@isTest
public class usecaseTest {
    @istest
    Public static void main(){
        Account acc = New Account(Name = 'usecase' );
            Test.startTest();
        		insert acc;
        	Test.stopTest();
        Account ins= [Select Description from Account Where Id =: acc.Id];
        System.assertEquals('First usecasetest', acc.Description);
    }
}