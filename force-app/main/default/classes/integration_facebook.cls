public class integration_facebook {
    public void invoke(){
        Http p=new Http();
        String url='https://graph.facebook.com/oauth/access_token?client_id=1720575748442191';
        url=url+'&client_secret=3284154e147dcebea26a500edab975a2';
        url=url+'&grant_type=client_credentials';
        HttpRequest req=new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        HttpResponse res=p.send(req);
        string result=res.getBody();
        system.debug(result);
        
    }

}