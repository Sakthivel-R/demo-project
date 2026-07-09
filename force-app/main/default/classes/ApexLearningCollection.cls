public class ApexLearningCollection {
    public void list01(){
        List<String> str= new List<String>();
        List<String> str1= new List<String>();
        Set<String>  set1=new Set<String>();
        //list<Account> var=new List<Account>();
        
        str.add('a');
        str.add('b');
        str.add(1,'N');
        
        
        str1.add('c');
        str1.addAll(str);
        
        //str.add('c');
        //str.add('a');
        
        set1.add('a');
        
        str1.addAll(set1);
        //str1 = str.clone(); in clone exceting value in str1 are delected and str values are add in str1
        //boolean res = str.contain('b'); it check the value in the list or not return true or false.
        //boolean res=str.equals(str1); it check index and value ;
        //.Get(index) it is used to display value in the index
        //.getSobjectType(); it tell type 
        //.indexOf('a') it display the index value of a
        //.isEmpty() it check the list is empty or not
        //.size() give the size of list start from 1
        //.sort() it print in order
        //
        
        System.debug('str  '+str);
        System.debug('str1  '+str1);
        //System.debug('equ  '+res);
    }

}