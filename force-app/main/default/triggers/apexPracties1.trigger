trigger apexPracties1 on Contact (before insert,before update,after insert) {
       /*if(Trigger.isafter){
        list<account> acc=new List<account>();
        if(trigger.isinsert){
            for(contact con:trigger.new){
                if(con.account == null){
                    account acc1=new account();
                    acc1.name=con.lastname;
                    acc1.Phone=con.phone;
                    acc.add(acc1);
                }
            }
        }
        if(acc != null){
            insert acc;
        }
    }*/
    
    if(trigger.isbefore){
        if(trigger.isinsert || trigger.isupdate){
            for(contact con:trigger.new){
                if(con.Phone == '' || con.Phone == null){
                    con.adderror('it show error on popup error msg');
                    con.phone.adderror('it show error under the field');
                }
                if(con.email==null || con.email==''){ 
                    
                    con.adderror('it show error on popup error msg');
                    con.email.adderror('it show error under the field');
                }
            }
        }
    }
   

}