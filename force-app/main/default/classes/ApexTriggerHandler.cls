public class ApexTriggerHandler {
    
    Public Static void SendEmailOnUndelete(List<Account> accountListNew){
     
        List<messaging.SingleEmailMessage> emailObjs = new List<messaging.SingleEmailMessage>();
            
        for(Account accNew:accountListNew){
            Messaging.SingleEmailMessage emailObj = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(Userinfo.getUserEmail());
            emailObj.setToaddresses(emailAddress);
            emailObj.setSubject('Account has been Sucessfully restored'+ accNew.Name);
            emailObj.setPlainTextBody('Hello.. no message');
            emailObjs.add(emailObj);
        }
        messaging.sendEmail(emailObjs);

    }
    
    public Static void ErrorBeforeDelete(List<Account> AccountListold){
        for(Account AccOld: AccountListold){
            if(AccOld.Active__c == 'Yes'){
                AccOld.addError('you cannot delete an active account');
            }
        }
    }

}