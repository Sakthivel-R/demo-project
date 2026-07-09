// one trigger per one object is best because order of execution is not guaranteed if multiple trigger written on same object
// Avoid DML statement/SOAL queries in for loop
// TriggerHandler is justlogic of the trigger in another class, apex suggest write trigger logic in triggerhandler 
//...and call the class in trigger ..ex::SCENARIO 8(AFTER UNDELETE) , SCENARIO 6(BEFORE DELETE)
// Avoid recursion by using BOOLEAN VARIABLE ex in ApexContactTrigger AND ApexContactTriggerHandler
trigger ApexTrigerLearning on Account (before insert,After Insert,Before Update,After Update,BEFORE DELETE,AFTER DELETE,AFTER UNDELETE) {
     
    //  execute order flow check->before trigger->  DataBase  ->After Trigger->WorkFlow->ProcessBuilder->Flow
    //NEVER write Insert/Update DML in before Event
    //
    //Context Variable    : Values which developer needs to write logic
    //Context Variable 1  :Trigger.New ->List of records that are got inserted/updated
    //Context Variable 2  :Trigger.isBefore->Return True if trigger is run Before the Event
    //Context Variable 3  :Trigger.isInsert->Return True if trigger is called when user has done insert operation
    //Context Variable 4  :Trigger.isAfter->Return True if trigger is called after the record is inserted/updated 
    //Context Variable 5  :Trigger.old ->Return the List of records that are inserted/updated with old/prior Value
    //Context Variable 6  :Trigger.NewMap ->Return the List of records that are inserted/updated with latest value in map formate
    //Context Variable 7  :Trigger.OldMap ->Return the List of records that are got inserted/updated with old/prior value in map formate
    //Context Variable 8  :Trigger.isupdate ->Return true if trigger is called when record is updated
    //Context Variable 9  :Trigger.isDelete ->Return true if trigger is called when record is Delete
    //Context Variable 10  :Trigger.isUndelete ->Return true if trigger is called when record is unDelete
    //Context Variable 11  :Trigger.size -> how many record is inserted by using dataLoader or WorkBench if insert in UserInterface.. 
    //....it always 1 because user enter one value and save then create another 
    //Context Variable 12  :Trigger.isExecuting -> by Know Method is call by Trigger or Not

    /*SCENARIO 8(AFTER UNDELETE);send email to the user, when user restores an account from recycle bin */
    
    //trigger.new && trigger.newMap are available
    //trigger.old && trigger.oldMap are not available
    
    if(Trigger.isAfter && Trigger.isUndelete){
        ApexTriggerHandler.SendEmailOnUndelete(Trigger.New);
     }
    
    
    /*SCENARIO 7(AFTER DELETE):when user delete an account,Send an confirmation email to the user*/
    //trigger.old && trigger.OldMap are available
    //trigger.new && trigger.newmap are not available
    If(Trigger.IsAfter && Trigger.IsDelete){
        
        List<messaging.SingleEmailMessage> emailObjs = new List<messaging.SingleEmailMessage>();
            
        for(Account accOld:Trigger.Old){
            Messaging.SingleEmailMessage emailObj = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(Userinfo.getUserEmail());
            emailObj.setToaddresses(emailAddress);
            emailObj.setSubject('Account has been Sucessfully Deleted'+ accOld.Name);
            emailObj.setPlainTextBody('Hello.. no message');
            emailObjs.add(emailObj);
        }
        messaging.sendEmail(emailObjs);
    }
    
    
    /*SCENARIO 6(BEFORE DELETE): an Active Account Should not be DELETED*/
    If(Trigger.isBefore && Trigger.IsDelete){
        ApexTriggerHandler.ErrorBeforeDelete(Trigger.old);
    }
    
    
    
    
    /*SCENARIO 5(AFTER UPDATE):if addres is changed in account the same addres is reflected in contact */
    if(Trigger.isAfter && Trigger.isUpdate){
        Set<Id> accIdWhichGotBillingAdressChanged = New Set<Id>();
        for(Account accrecNew:Trigger.New){
            Account accrecOld = trigger.OldMap.get(accrecNew.Id);
            if(accrecNew.BillingStreet != accrecOld.BillingStreet){
                accIdWhichGotBillingAdressChanged.add(accrecNew.Id);
            }
        }
        //This set accIdWhichGotBillingAdressChabged will have accountids which got billing address changed
      
        List<Account> accWithContacts = [Select id,name,BillingStreet,BillingCity,BillingState,BillingCountry,(Select id,name from Contacts) FROM Account WHERE Id in: accIdWhichGotBillingAdressChanged];
        List<Contact> contsListToUpdate = New List<Contact>();
        
        for(Account acc: accWithContacts){
            List<Contact> consOfTheLoopedAccount =acc.contacts;
            for(Contact con: consOfTheLoopedAccount){
                con.mailingStreet = acc.BillingStreet;
                con.mailingCity = acc.BillingCity;
                con.mailingState = acc.BillingState;
                con.mailingcountry = acc.BillingCountry;
                contsListToUpdate.add(con);
            }
        }
        If(contsListToUpdate.size() > 0){
            UPDATE contsListToUpdate;
        }
    }  
    
    
    /*SCENARIO 4(BEFORE UPDATE):if Account name is Change during update it show error  */
    if(Trigger.isBefore && Trigger.isUpdate){
        for(Account accNew:Trigger.new){
            Account accold=Trigger.oldMap.get(accNew.Id);
            if(accold.Name != accNew.Name)
                accnew.addError('do not change account name');
        }
    }
    
    
    
    /*SCENARIO(AFTER INSERT) 3: if Account is inserted contact is created automaticaly */
    if(Trigger.isAfter && Trigger.IsInsert){
        List<Contact> cons=New List<contact>();
        for(Account acc:Trigger.New){
            Contact con=New Contact();
            con.Lastname=acc.Name;
            con.accountid=acc.Id;
            cons.add(con);
        }
        if(Cons.Size()>0)
            insert cons;
    }
    
    /*SCENARIO 2 (BEFORE INSERT VALIDATION RULE): Throw Error if AnnualRevenue is less than 1000 */
    if(Trigger.isBefore && Trigger.isInsert){
        for(Account acc:Trigger.new){
            if(acc.AnnualRevenue<1000)
                acc.AddError('AnnualRevenue is cannot less than 1000');
        }
    }
    
    
    /* SCENARIO 1(BEFORE INSERT):prepopulate shipping address*/
    if(Trigger.isBefore && Trigger.isInsert){
        for(Account acc:Trigger.New){
            
            if(acc.ShippingStreet==Null)
                acc.ShippingStreet=acc.BillingStreet;
            if(acc.ShippingCity==Null)
                acc.ShippingCity=acc.BillingCity;
            if(acc.ShippingCountry!=acc.BillingCountry)
                acc.ShippingCountry=acc.BillingCountry;
            if(acc.ShippingState==Null)
                acc.ShippingState=acc.BillingState;
            if(acc.ShippingPostalCode==Null)
                acc.ShippingPostalCode=acc.BillingPostalCode;
        }
    }
    

}