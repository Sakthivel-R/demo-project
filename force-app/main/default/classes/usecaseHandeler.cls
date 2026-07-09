public class usecaseHandeler implements usecaseInterface {
    public void beforeInsert(List<SObject> newList){
        List<Account> acc= (List<account>) newList;
        for(Account ac:acc){
            ac.Description = 'First usecasetest';
        }
    }
    public void AfterInsert(List<SObject> newList, List<SObject> oldList){}
    public void beforeUpdate(List<SObject> newList){}
    public void AfterUpdate(List<SObject> newList, List<SObject> oldList){}

}