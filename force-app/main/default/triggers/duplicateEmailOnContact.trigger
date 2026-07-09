trigger duplicateEmailOnContact on Contact (before insert, before update) {
    
    if(trigger.isbefore && trigger.isinsert){
        set<string> mail = new set<string>();
        for(Contact con: trigger.new){
        mail.add(con.email);
    	}
        if(trigger.isbefore && trigger.isupdate){
        for(contact con: trigger.new){
            if(con.Email != trigger.oldmap.get(con.Id).Email){
                mail.add(con.Email);
            }
        	}
        }
        Map<string, contact> existing= new Map<string, contact>();
        For (contact con: [SELECT id, email, accountId from contact where email in:mail]){
            existing.put(con.Email, con);
        }
        for(Contact con: trigger.new){
            if(existing.containskey(con.Email)){
                con.addError('duplicate mail');
            }
        }
    }    
    
}