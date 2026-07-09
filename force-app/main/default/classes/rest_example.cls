@RestResource(urlMapping='/exampleforrest/*')
global class rest_example {
    @HttpGet
    global static string getdata(){
        RestRequest req=RestContext.request;
        map<string,string> param=req.params;
        String searchText =param.get('industry');
        list<Account> acc=[select name from Account where industry=:searchText];
        System.jsonGenerator js=json.CreateGenerator(true);
        js.writestartObject();
        js.writeStringField('Startus','Sucess');
        js.writeNumberField('count',acc.size());
        if(acc.size()>0){
            js.writefieldName('Accounts');
            js.writestartArray();
            for(Account a:acc){
                js.writeString(a.name);
            }
            js.writeEndArray();
        }
        js.writeEndObject();
        string result=js.getAsString();
        return result;
    }

}