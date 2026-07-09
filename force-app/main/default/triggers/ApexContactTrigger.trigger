//in below we use after insert by using handeler we insert the contact so the trigger is again called and handler create
//...another contact it run again and again to prevent recursion we simply use one boolean variable

trigger ApexContactTrigger on Contact (after insert) {
    if(Trigger.isAfter && trigger.IsInsert && !ApexContactTriggerHandler.isTriggerRan){
        ApexContactTriggerHandler.isTriggerRan=true;
        ApexContactTriggerHandler.CreateDuplicateContact(Trigger.New);
        
    }

}