trigger usecase on Account (before insert, after insert, before update, after update) {
    usecaseHandeler usc= New usecaseHandeler();
    if(usecaserecursion.isfirst()){
        if(Trigger.isinsert && Trigger.isBefore){
            usc.beforeInsert(Trigger.New);
        }
    }
}