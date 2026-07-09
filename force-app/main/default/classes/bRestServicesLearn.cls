//postMethod
@RestResource(urlMapping='/postmethod/*') 
// '*'in the last for if you use get Method we give prameter in url that so
global class bRestServicesLearn {
    @httpPost
    global static string create_contact(string lastName,string firstName,string phone){
        system.jsonGenerator js=json.createGenerator(true);
        js.writeStartObject();
        try{
            Contact con=new Contact();
            con.LastName  = lastName;
            con.FirstName = firstname;
            con.Phone	  = phone;
            insert con;
            js.writeStringField('status','success');
            js.writeidField('id',con.Id);
        }catch(exception e){
            js.writeStringField('status','fail');
            js.writeStringfield('Error',e.getTypeName());
             js.writeStringfield('Error',e.getMessage());
        }
        js.writeEndObject();
        string str=js.getAsString();
        return str;
    }
    @httpGet
    global static string getMethod(){
		RestRequest req=RestContext.request;
        map<String,String> para=req.params;
        string lastName=para.get('lastName');
        string firstName=para.get('firstName');
        string phone=para.get('phone');
        system.jsonGenerator js=json.createGenerator(true);
        js.writeStartObject();
        try{
            Contact con=new Contact();
            con.LastName  = lastName;
            con.FirstName = firstname;
            con.Phone	  = phone;
            insert con;
            js.writeStringField('status','success');
            js.writeidField('id',con.Id);
        }catch(exception e){
            js.writeStringField('status','fail');
            js.writeStringfield('Error',e.getTypeName());
             js.writeStringfield('Error',e.getMessage());
        }
        js.writeEndObject();
        string str=js.getAsString();
        return str;
    }
    

}