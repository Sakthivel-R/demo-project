trigger accounttochecklwc on Account (before insert) {
    if(trigger.isBefore && trigger.IsInsert){
        for(Account acc:Trigger.new){
            if(acc.Name == 'sakthivel'){
                acc.adderror('not valid');
            }
            }
        }
    }