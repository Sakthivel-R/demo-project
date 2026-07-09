/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : lightningDataTable
 * Author          : <YourName>
 * Created Date    : Feb 17, 2026
 * Last Modified By: <YourName>
 * Last Modified On: Feb 17, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Feb 17, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public class lightningDataTable {

	@AuraEnabled(cacheable=true)
	public static List<Account> getAccounts() {
		return [SELECT Id, Name, Phone, Industry from Account limit 50];
		// Your logic here
	}
	@AuraEnabled
	public static void updateacc(List<Id> accountIds, String newrating){
		System.debug(accountIds);
		List<Account> accs = [SELECT Id,Industry from Account where Id IN: accountIds];
		FOR(Account acc: accs){
			acc.Industry = newrating;
		}
		update accs;
	}

}