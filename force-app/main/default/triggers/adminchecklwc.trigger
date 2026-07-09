trigger adminchecklwc on admin_1__c (before insert,after insert) {
       // List<Grant_Application__c> Child=NEW  List<Grant_Application__c>();
        if(trigger.isAfter && trigger.IsInsert){
            list<Contact> cons=NEW List<Contact>();
        for(admin_1__c grant:Trigger.new){
                Contact con = New Contact();
                con.LastName = grant.Name;
            con.admin_1__c=grant.Id;
                //con.Phone = grant.Phone__c;
                //con.OtherAddress = grant.Mailing_Postal_Code__c;
                //con.Description = grant.Applicant_First_Name__c + grant.Applicant_Last_Name__c + 'grant Application';
                cons.add(con);
            }
        Database.insert(cons);
    }
        }


//admin_1__c ad=[select name,id,Support_option__c from admin_1__c where phone__c =:acc.phone__c];
                //ad.name=acc.Name;
                //ad.Support_option__c=acc.Support_option__c;
                
                //for(admin_1__c na:ad){
               //na.name = na.Support_option__c == '500 per month 3 month' ? na.name +'dup3month' : na.Support_option__c == '300 per month 6 month' ? na.name +'dup6month' : na.name +'dup12month' ;
                //na.name = acc.name + 'duplicate' ;
                //na.Support_option__c=acc.Support_option__c;
    
           // }