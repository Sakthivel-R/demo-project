public interface usecaseInterface {
    void beforeInsert(List<SObject> newList);
    void AfterInsert(List<SObject> newList, List<SObject> oldList);
    void beforeUpdate(List<SObject> newList);
    void AfterUpdate(List<SObject> newList, List<SObject> oldList);
}