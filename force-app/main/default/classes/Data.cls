public class Data {
    public void da(){
        child__c ch=new child__c();
        ch.Name='hi';
        ch.name__c='gg';
        System.debug('hh'+ch);
        insert ch;
    }

}