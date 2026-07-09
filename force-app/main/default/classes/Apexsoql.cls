public class Apexsoql {
    // salesforce object query language
    // soql in query editor
    
 /* use ":" bind variable for access varible in query like

String MyName = 'vasu';
List<Contact> ListOfName = [SELECT FirstName, LastName FROM Contact WHERE FirstName =  : MyName];

use "=" operator is simple Equal operator in query like-:

List<Contact> ListOfName = [SELECT FirstName, LastName FROM Contact WHERE FirstName =  'vasu'];
[give contact list where firstName = (equal) vasu] 


use IN operator in soql for refer LIST or SET direct in query like

List<String> lstOfStr = new List<String>{'testName','testName2'};
List<Contact> ListOfName = [SELECT FirstName, LastName FROM Contact WHERE FirstName IN : lstOfStr];
[here also use bind ":" operator for access varible value in query ]
i hope  it helps you

*/
  
   /* public void que(){
    List<Account> acc= new List<Account>();
    String str='ram';


    acc = [Select id,Name from Account where Name=: str];
    System.debug(acc);
    }
    //Null check
    public void nullche(){
    List<Account> acc= new List<Account>();
    String str='ram';
    acc = [Select id,Name from Account where Name=: str];
        if(!acc.isEmpty()){
            for(Account a: acc){
                
            }
        }
    System.debug(acc);
    }
    
    public void count1(){
        List<Account> acc= new List<Account>();
    String str='ram';
        integer c;
        //count is used to get how many records
        //like is used to get the record in some relate words like  starte name
    c = [Select count() from Account where Name like 's%'];
        System.debug(c);
    }
    
    public void ordering(){
        List<Account> acc= new List<Account>();
    String str='ram';
        integer c;
        //order is used to assending or dessending for dessending use DESC keyword
    acc = [Select id,name from Account where Name like 's%' ORDER By Name DESC];
        System.debug(acc);
        
    }
    
    public void parenttochild(){
        // get the child name from click object childname => filed and relation => click parent name and copy the child name 
        // 
        // for custom object we get the name in same way but in child custome fileld denote __r like contacts__r in custom fields
        
        List<Account> acc= new List<Account>();
    String str='ram';
        integer c;
    //acc = [Select id,name , (Select id, name,phone from Contacts) from Account where Name= 'sakthi'];
        System.debug(acc);
        if(!acc.isEmpty()){
            for(Account ac: [Select id,name , (Select id, name,phone from Contacts) from Account where Name= 'sakthi']){
                //System.debug('result'+ ac.Contacts);
               // for(Contact con:ac.Contacts){
                    
      
                for(Contact con:ac.Contacts){
                    
                }
            }
        }
        
    }
    
    public void childtoparent(){
        //child to parents  __r for only custom object ,if u use standerd object it not use
        List<book__c> acc=new List<book__c>();
        acc=[select id,name, Student__r.name, Student__r.roll_number__c from book__c ]
    }*/
}