@isTest
public class Rest_testClass02 {
    @isTest
    public static void te(){
        Rest_testClass res=new  Rest_testClass();
        Test.setMock(httpCalloutMock.class,res);
        Rest_testClass01 req=new Rest_testClass01();
        req.invoke();
        integer count=[select count() from Account where name='wipro'];
        system.assertEquals(count,1);	
    }

}