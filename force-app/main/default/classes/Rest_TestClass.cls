//HttpCalloutmock :: is a test responces interfaces by using this we can make dumy responces
// defined methods RESPOND
// this is response
@isTest
global class Rest_TestClass implements HttpCalloutmock {
    global HttpResponse Respond(HttpRequest request){
        system.assertEquals(request.getEndPoint(),'https://www.dumyResponce.com/student');
        system.assertEquals(request.getMethod(),'GET');
        string str=request.getBody();
        
        /*System.jsongenerator js=json.createGenerator(true);
        js.writeStartObject();
        js.writeStringField('student','sakthi');
        js.writeNumberField('age',23);
        js.writeStringField('city','kum');
        js.writeEndObject();
        String result=js.getAsstring();*/
        httpResponse res=new httpResponse();
        res.setStatus('success');
        //res.setBody(result);
        res.setBody('wipro');
        return res;
        
    }

}