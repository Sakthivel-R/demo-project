//1) json.serialize(variable)  it display all value
//2) json.serialize(variable,supressObjectNUll);
//				(a,true); it don't display the null value
//3) json.serializePretty(variable) it display line by line
//example how the print result 1 vs 3
//	eg) 1{'name':'sakthi','age':'20'}		eg)3 {
//													'name':'sakthi';
//													'age':'20'
//
//												  }
//4) json.serializePretty(variable,supressObjectNull) 

//integer a=10
//string a=(string) a

public class json_practies {
    public static void json(){
        integer a=10;
        string js=json.serialize(a);
        system.debug(js);
    }
    
  /*1) deserialize it is used to convert json to another type
    sysntax: (convertation type)json.deserialize(jsonvariable,convertation type)
     we don't convert data into map in above syntax
    
    2) deserializeStrict In some times in deserialize unmatched field are ignored but using this all the field are
     --taken it some times error because we can't add lastname filed in account .in deserilize it ignore the lastname value 
   	 --add others

	3)deserializeuntyped it over caome above two problem,When you don't know which type of data we convert this json string
		-- at this time we use this or the data is combine of account ,contact and balala.. we con't convert it to account or
		-- contact because the other data are ignored
	syntax: map<string,Object> ma=(map<string,Object>)json.deseriualizeUnTyped(jsonvariable);
				we use string,integer.. but Object is constent,we don't need cast
     */
    

    public void deserialize(){
		/*string a='20';
		integer b=(integer)json.deserialize(a,integer.class); 
        
		string cn='{'name':'sak','phone':'1233321','fax':'fih'}';
		account acc=(account)json.Deserialize(cn,account.class); */
	}
}