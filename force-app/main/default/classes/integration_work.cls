//this is given in the  mezp meeting

public class integration_work {
    @AuraEnabled(cacheable=true)
    // it is used to use in lwc
    public static void create_Data(String AccId){
        //to retriev account data
        //
        Account acc=[select id,name,status__c,Start_Date__c from account where id=: AccId];
       //To retrive contact data wich are releated to account
       list<contact> con=[select name,phone,primary__c,place__c from contact where account.id=:acc.Id];
        //json formate
        system.jsonGenerator js=json.createGenerator(true);
        js.writeStartObject();
        js.writefieldName('Account');
        	js.writeStartObject();
        if(acc.Name!=''&&acc.Name != Null){
        	js.writestringField('Name',acc.Name);
        }
        if(acc.Status__c!=''&&acc.Status__c!= Null){
        	js.writestringField('Status',acc.Status__c);
        }else{
            js.writeStringField('Status','NULL');
        }
        if(acc.start_Date__c != Null){
        	js.writeDateField('Start Date',acc.start_Date__c);
        }
        	//js.writeendObject();
        if(con.size()>0){
            js.WriteFieldName('contact');
                js.writeStartArray();
            for(contact con1:con){
                js.WriteStartObject();
                js.WriteStringField('Name',con1.Name);
                if(con1.Phone!=''&& con1.Phone!= Null){
                	js.WriteStringField('Phone',con1.Phone);
                }if(con1.place__c!=''&& con1.place__c!= Null){
                	js.WriteStringField('Location',con1.place__c);
                }if(con1.Primary__c!=''&& con1.Primary__c!= Null){
                	js.writeStringField('Primary',con1.Primary__c);
                }
                js.WriteEndObject();
            }
                js.WriteEndArray();
        }
        js.writeendObject();
        js.WriteEndObject();
        string jsons=js.getAsString();
        //Print json formate for reference
        system.debug(jsons);
        
        //callout
        Http p=New Http();
        HttpRequest res=New HttpRequest();
        res.setEndpoint('https://run.mocky.io/v3/f2b2dbd3-795a-49a6-8608-d073278a8c45');
        res.setMethod('POST');
        res.setbody(jsons);
        HttpResponse response=p.send(res);
        //response
        system.debug(response.getbody());
        
    }

}

/*
 Request:

{
  "Account": {
    "Name": "Vels Fruit Shop",
    "Status": "Active",
    "Start Date": "21-10-2023",
      "Contacts": [
        {
          "Name": "ShakthiVel",
          "Phone": "8798090989",
          "Location": "Chennai",
          "Primary":"True"
        },
        {
          "Name": "Shakthi",
          "Phone": "8798012989",
          "Location": "Chennai",
          "Primary":"False"
        }
  	]
  }
}



URL : https://run.mocky.io/v3/f2b2dbd3-795a-49a6-8608-d073278a8c45

Response:
{
  "Result": "Success",
  "Comment": "Account details added"
}

 */