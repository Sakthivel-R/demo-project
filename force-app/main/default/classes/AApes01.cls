public class AApes01 {
    
    //for update is a key word for 
    //
    //List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name = ‘SpecificAccountName’ FOR UPDATE];
    // if you try to say “FOR UPDATE” (or, “nobody touch it!”) 
    // 
    // in future method premitive is necessery
    // future we declare STATIC VOID  ** WHY VOID because in asyno apex we not able to return any  this are only 
    // ..send result when the value avalible
    // it take only primitive as param like int,bool,id... which are not change else account ... it change in the process
    // .. time not every time but some
    // setup and non setup time we use this, con't call future method from another future method
    
    Public AApes01(){
        BreakFast();
        Out();
        CarService();
        Movie();
    }
    
    Public Static Void BreakFast(){
        System.debug('BreakFast');
    }
    
    Public Static Void Out(){
        System.debug('Out');
    }
    @Future
    Public Static Void CarService(){
        System.debug('CarService');
    }
    
    Public Static Void Movie(){
        System.debug('movie ');
    }

}