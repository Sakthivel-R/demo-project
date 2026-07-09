/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : AccountContactController
 * Author          : <YourName>
 * Created Date    : Feb 16, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Feb 16, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Feb 16, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public with sharing class AccountContactController {

	@AuraEnabled(cacheable=true)
	public static List<Account> getAccounts() {
		return [Select Id,Name from Account limit 10];
	}

	@AuraEnabled(cacheable=true)
	Public static List<Contact> getcontacts(Id accid){
		return [Select Id, Name from Contact where AccountId =: accid];
	}

}