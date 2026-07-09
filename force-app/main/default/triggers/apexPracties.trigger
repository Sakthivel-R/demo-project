trigger apexPracties on Account (before insert , before Update,After INSERT) {
    
   /* if(trigger.isbefore){
         if(Trigger.isinsert || trigger.isupdate){
            for(Account acc:trigger.new){
                /*if(acc.Industry == 'Banking' || acc.Industry == 'HealthCare'){
                    acc.Rating = 'Hot';
                }
                if(acc.Industry =='banking'){
                    acc.annualrevenue=5000000;
                }
                else if(acc.Industry == 'insurance'){
                    acc.AnnualRevenue=3500000;
                }
                else if(acc.Industry =='healthcare'){
                    acc.AnnualRevenue=2500000;
                }
                else{
                    acc.AnnualRevenue=500000;
                }
            }
        }
    }*/
    
    /*if(Trigger.IsAfter){
        list<contact> con1 = new List<contact>();
        if (Trigger.isInsert){
        
            for(Account acc:Trigger.new){
                contact con=new contact();
                con.AccountId = acc.Id;
                con.LastName = acc.Name;
                con.Email=acc.name +'@gmail.com';
                con.Phone='12345';
                con1.add(con);
            }
        }
        if(!con1.isEmpty()){
            insert con1;
        }
    }*/
    
    if(Trigger.IsAfter && Trigger.isinsert){
        list<contact> con = new list<contact>();
        list<opportunity> opp1= new list<opportunity>();
        for(Account acc:Trigger.new){
            if(acc.contact__c){
                contact con1 = new contact();
                con1.AccountId=acc.id;
                con1.LastName=acc.Name;
                con1.Email=acc.Name +'@gmail.com';
                con1.Phone=acc.Phone+'5432';
                con.add(con1);
            }
            if(acc.opporuti__c && acc.Active__c=='yes'){
                opportunity opp=new opportunity();
                opp.accountid = acc.id;
                opp.Name=acc.Name;
                opp.closeDate=system.today();
                opp1.add(opp);
            }
        }
        if(!con.isEmpty() || !opp1.isEmpty()){
            insert opp1;
            insert con;
        }
    }
 

}