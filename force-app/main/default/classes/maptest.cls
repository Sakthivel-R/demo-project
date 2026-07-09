public class maptest {
    public void ma(){
        map<id,Account> it=new map<id,Account>([Select id,Name FROM Account limit 2]);
        System.debug('hi'+it);
    }

}