public class Rest_testClass01 {
    public void invoke(){
        string endPoint='https://www.dumyResponce.com/student';
        Http p=new Http();
        HttpRequest req=new HttpRequest();
        req.setEndPoint(endPoint);
        req.setmethod('GET');
        HttpResponse res=p.send(req);
        string result=res.getBody();
        Account acc=new Account();
        acc.name=result;
        acc.industry='Banking';
        insert acc;
    }

}