public with sharing class scheduableclass implements Schedulable{
    public void execute(schedulablecontext sc){
        Account acc = new account(Name = 'hi' + Date.today());
        insert acc;
    }

}