public class ApexRunFLow {
    public  void runflow(){
        Map<String,Object> param = New Map<String,Object>();
        param.put('recordId','0065j00000Y51IYAAZ');
        //flow name 
        Flow.Interview.Fetch_opp_Stage_v1 fetchopp=new Flow.Interview.Fetch_opp_Stage_v1(param);
        fetchopp.start();
        
        String result=(String) fetchopp.getvariablevalue('OppStage');
        System.debug('Flow Returned' + result);
        
    }

}