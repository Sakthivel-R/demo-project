public class ApexLearningMap {
    public void map01(){
        Map<integer,String> intstr = new Map<integer,String>();
        map<id,Account> idacc=new Map<id,Account>([Select id,name from Account Limit 2]);
        
        intstr.put(1,'a');
        intstr.put(2,'b');
        //.remove(key)
        //.size()
        //.values()
        //.keySet()
        //.clear()
        //.clone()
        //.containsKey(key)
        //.get()
        //.Equals()
        //.isEmpty()
        system.debug('Map=> '+intstr);
        System.debug('idMap '+idacc);
    }

}