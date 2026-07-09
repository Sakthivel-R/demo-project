// 3MVG9pRzvMkjMb6mHgRV_9zDzJlCPi74S34cJVIM9GJ_hHoXq8k8vdoAd7MTlIWfUwLMFgBHOeum50zq3kui_
// D91F57BFB60BEE04E57B0837119F754BDB56FD269AEE24DBDFE1310CF9F7367E
// rsakthivel12th@gmail.com
// Sakthi@123
// 00D5j00000196EH!ARcAQLK6dBGSon0v51aicXaPU8F8KgyY1GifVXbTX5Uw2cgzlhvHhY_Iq6E_CLSe346hbbYRqhQLYOWIsbY.rHouatXq35RK

public class INTOauth_UName_Password {
    public string ClientId	    {set;get;}
    public string ClientSecret	{set;get;}
    public string username		{set;get;}
    public string password		{set;get;}
    public string accessToken	{set;get;}
    public string result		{set;get;}
    public string endPoint		{set;get;}
    public string industry		{set;get;}
    public INTOauth_UName_Password(){
        endPoint='https://login.salesforce.com/services/oauth2/token';
    }
    public void send(){
        Http p=new Http();
        HttpRequest req=new HttpRequest();
        req.setEndPoint(endpoint);
        req.setMethod('POST');
        string body='grant_type=password';
        body=body+'&client_id='+ClientId;
        body=body+'&client_secret='+ClientSecret;
        body=body+'&username='+username;
        body=body+'&password='+password;
        req.setBody(body);
        HttpResponse res=p.send(req);
        result=res.getBody();
        system.jsonparser jp=json.createparser(result);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token'){
                jp.nextToken();
                accessToken=jp.getText();
            }
        }
    }
    public void invoke(){
        string endpoint='https://sakthivelr-dev-ed.my.salesforce.com/services/apexrest/exampleforrest?+industry'+industry;
        http p=new http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint(endpoint);
        req.setmethod('get');
        req.setHeader('Authorization','OAuth '+accessToken);
        HttpResponse res=p.send(req);
        result=res.getBody();
    }
}
//if you want to access the security code from url by using
//apexPage.currentpage().getparameters().get('your ruturn code string by giving client id and redirect url')
//
//there is 3 type to access oauth 
//1.above full code like give username & password
//2.send client id & redirect url . it give code .then send client id , client creditional , code . it give access token
//3.client creditional  only client id,creditional onaly
//
//always refer the document of the server to find wich type it is