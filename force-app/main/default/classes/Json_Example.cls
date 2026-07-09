public class Json_Example {
    
    public string str	{set;get;}
    
    public Json_Example(){
        System.JSONGENERATOR js=json.creategenerator(true);
        js.writestartobject();
        	js.writestringfield('name','sakthi');
        	js.writeFieldName('age');
        	js.writeNumber(10);
        js.writeEndobject();
        str=js.getAsString();
    }
}