public class ApexLearningDateBase {
    Public void DATAINS(){
        List<Contact> contactFirst= new List<Contact> {
            new Contact(FirstNAme='sakthi',LastName='vel'),
            new Contact(FirstName='vikas',LastName='summa'),
            new Contact()};
            //in above LastName is Required field so error is raised
            
           DataBase.SaveResult[] srList=DataBase.insert(contactFirst , false);
 			// in above the result are saved in srlist successor Fail
 			
        for(DataBase.SaveResult sr : srList){
            if(sr.isSuccess()){
                System.debug('Successfully inserted contact.Contact ID:'+sr.getId());
            }else {
                for(DataBase.Error err:sr.getErrors()) {
                    System.debug('The following error has occurred');
                    System.debug(err.getStatusCode() + ':' + err.getMessage());
                    System.debug('contact fields that affected this error: '+err.getFields());
                }
            }
        }
        
    }

}