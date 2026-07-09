/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : wrapperuse
 * Author          : <YourName>
 * Created Date    : Feb 19, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Feb 19, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Feb 19, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public with sharing class wrapperuse {

	@AuraEnabled(cacheable=true)
	public static List<wrapperClass> doSomething() {
		List<Account> acclist= [SELECT Id,Name, Industry, (SELECT Id from Contacts) from Account limit 10];

		List<wrapperClass> wrap= new List<wrapperClass>();
		for(Account acc:acclist ){
			Integer c=acc.contacts!= null?acc.Contacts.size() : 0;
			wrap.add(new wrapperClass(acc, c));
		}
		return wrap;
	}

}