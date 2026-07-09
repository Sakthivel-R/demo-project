public class ApexSOSL {
    
    // find searchQuery [inSearchGroup   like allfield,namefield..][returningObjecyAndField]
    // it means you have a list of a list of objects such as a list of account list, contact list, opportunity list,.. 
	//it is use main in SOSL, or also known as global search.
    public void sos(){
    List<List<sobject>> sob=[Find 'sakthi' in ALL FIELDS RETURNING Account(Name),contact(Lastname,EMAIL LIMIT 2) ];
    
    list<Account> acc= New List<Account>();
    List<contact> con=New List<contact>();
    
    acc =(List<account>) sob[0];
    con=(List<Contact>) sob[1];
    
    for(Account acc1:acc){
        System.debug('acc+' + acc1.Name);
    }
    for(contact con1:con){
        System.debug('acc+' + con1.LastName);
    }
    }
//  WE USE THIS IN QUERY EDITOR BY EXAMPLE.
    //  Find {sakthi} in ALL FIELDS RETURNING Account(Name),contact(Lastname LIMIT 2)
}

/*String searchQuery = 'FIND \'' + searchStr1 + '\' IN ALL FIELDS RETURNING  Account (Id,Name,type),Contact(name,email),Opportunity(name,StageName)';

   List<List <sObject>> searchList = search.query(searchQuery);

   accList = ((List<Account>)searchList[0]);
   conList  = ((List<contact>)searchList[1]);
   optyList = ((List<Opportunity>)searchList[2]);
*/