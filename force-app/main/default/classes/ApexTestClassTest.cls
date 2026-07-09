@IsTest

// in test atleast 75% code we check go to the apes code in top left under the file
//  name=> code coverage =>drop down box
public class ApexTestClassTest {
    @isTest
    public Static void warmTemTest(){
        Decimal rec=ApexTestClass.ftoc(70);
        System.assertEquals(21.11, rec);
    }
    @isTest
    public Static void ColdTemTest(){
        Decimal rec=ApexTestClass.ftoc(80);
        System.assertEquals(21.11, rec);
    }

}