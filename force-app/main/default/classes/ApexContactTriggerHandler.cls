public class ApexContactTriggerHandler {
    public Static Boolean isTriggerRan=False;
    public Static void CreateDuplicateContact(List<contact> newConsList){
        List<Contact> dupConsToInsert=new List<Contact>();
        for(Contact con:newConsList){
            Contact con1=new Contact();
            con1.lastName = 'Duplicate Contact';
            dupConsToInsert.add(con1);
        }
        INSERT dupConsToInsert;
    }
}