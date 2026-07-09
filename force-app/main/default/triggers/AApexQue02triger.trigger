trigger AApexQue02triger on Account (After insert) {
    
    if(Trigger.isAfter && Trigger.isInsert){
        System.enqueueJob(New AApexQue02(Trigger.New));//Trigger.New has list of account created
    }

}