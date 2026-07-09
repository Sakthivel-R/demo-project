public class duplicatefind {
    @AuraEnabled(cacheable=true)
    public static admin_1__c named(String namefromlwc){
        return [Select Id FROM admin_1__c WHERE Name =: namefromlwc];
    } 

}