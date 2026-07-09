public with sharing class CustomerInformation {
    @AuraEnabled
    public static void 
        createCustomerInfo(String fname, String lname, Integer age, String gender){
            Customer_Information__c Customer = New Customer_Information__c(
            	First_Name__c = fname,
            	Last_Name__c = lname,
            	AGE__c = age,
            	Gender__c = gender);
            insert Customer;
        }
}