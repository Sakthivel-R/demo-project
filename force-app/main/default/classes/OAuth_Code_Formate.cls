public class OAuth_Code_Formate {
    public string clientId		{set;get;}
    public string clientSecret	{set;get;}
    public string code			{set;get;}
    public string redirectURL	{set;get;}
    public string accessToken	{set;get;}
    public string result		{set;get;}
    public string endpoint		{set;get;}
    public OAuth_Code_Formate(){
        redirectURL='https://sakthivelr-dev-ed.lightning.force.com/apex/RestResponces';
    }
    public PageReference requestCode(){
        string url='https://login.salesforce.com/services/oauth2/authorize';
        url=url+'?response_type=code';
        url=url+'&client_id='+clientId;
        url=url+'&redirect_uri='+redirectURL;
        PageReference p=new PageReference(url);
        return p;
    }

}
//https://sakthivelr-dev-ed--c.vf.force.com/apex/RestResponces?error=invalid_request&error_description=missing+required+code+challenge