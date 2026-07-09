trigger CaseAndContact on Case (Before insert) {
    If(Trigger.isBefore && Trigger.isInsert){
        set<String> Emails = New set<String>();
        For(Case c : Trigger.new){
            If(c.Email__c != null){
                Emails.add(c.Email__c);
            }
        }
        Map<String,Contact> existingContactDetails = new Map<String,Contact>();
        if(Emails != Null){
            for(Contact con: [Select id, email from Contact where email in: Emails]){
                existingContactDetails.put(con.email, con);
            }
        }
        List<contact> contactToInsert = new list<Contact>();
        For(case ca: Trigger.new){
            if(ca.Email__c == null){
                continue;
            }
            if(existingContactDetails.containsKey(ca.Email__c)){
                //ca.ContactId = existingContactDetails.get(ca.Email__c).id;
            }else{
                Contact con = new Contact(LastName = 'caseandcontact',email = ca.Email__c);
                contactToInsert.add(con);
                existingContactDetails.put(ca.Email__c, con);
            }
            
        }
        if(contactToInsert != null){
            insert contactToInsert;
        }
        for(case c: trigger.new){
            if(c.Email__c != null && existingContactDetails.containsKey(c.Email__c)){
                c.ContactId = existingContactDetails.get(c.Email__c).id ;
            }
        }
    }

}