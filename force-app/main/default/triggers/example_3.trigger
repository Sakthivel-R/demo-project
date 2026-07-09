trigger example_3 on Account (after insert,after update) {
    if(Trigger.isAfter && (trigger.isinsert || trigger.isupdate)){
        list<Opportunity> opp=new list<Opportunity>();
        for(account acc:Trigger.New){
            if(acc.industry == 'Agriculture'){
                Opportunity opp1=new Opportunity();
                opp1.AccountId = acc.id ;
                opp1.Name = acc.Name;
                opp1.StageName = 'Prospecting';
                opp1.Amount = 0;
                opp1.CloseDate =System.today() + 90;
                opp.add(opp1);
            }
        }
        insert opp;
        
    }

}