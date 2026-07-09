/*
	REST api services is used to create the server data avaliable to 3rd party 
		1) @RestResources(urlMapping='/YourUrl') --url is the reprentation of the class
		2) @httpDelete
		3) @httpGet
		4) @httpPost
		5) @httpPatch
		6) @httpPut

	Use Global class because you want to use this class out side
	use WITH SHARING because it show data matched with the user profiel

use text the class by using workbeanch salesforce in browser then >login > click utilize and select rest > copy this 
	services/apexrest/'yourUrlName'
*/

/* @RestResource(urlMapping='/dummy/*')
global class aRerstServicesLearn {
    @httpGet
    global static string invoke(){
        List<Account> acc=[Select Name,phone From Account];
        System.jsonGenerator js=json.createGenerator(true);
        js.writeStartObject();
        js.writeStringField('Status','Success');
        js.writeNumberField('count',acc.size());
        js.writeFieldName('Account');
        js.writeStartArray();
        	for(Account acc1:acc){
            	js.writeStartObject();
                js.WriteStringField('name',acc1.name);
                if(acc1.Phone!='' && acc1.Phone!=null)
                    //we can't use null in json
                js.writestringField('Phone',acc1.Phone);
                js.WriteEndObject();
        	}
        js.WriteEndArray();
        js.writeEndObject();
        String str=js.GetAsString();
        return str;
    }

} */
// in GET method they give request in url by using restRequest class

@RestResource(urlMapping='/dummy01/*')
global class aRerstServicesLearn {
    @httpGet
    global static string invoke(){
        System.jsonGenerator js=json.createGenerator(true);
        js.writeStartObject();
        try{
            RestRequest req=RestContext.request;
            map<String,String> para=req.params;
            Account acc=new Account();
            acc.name=para.get('name');
            acc.industry=para.get('industry');
            insert acc;
            js.writeStringfield('Status','Success');
            js.WriteidField('accid',acc.id);
            }catch(Exception e){
                js.WriteStringField('status','fail');
                js.WriteStringField('Message',e.getTypeName());
                }
        js.writeEndObject();
        String str=js.GetAsString();
        return str;
    }

}

//refresh token avaliable in  web service code formate method
//
//pagerefrence is a return type to easier the compination of(httprequest with GET method)