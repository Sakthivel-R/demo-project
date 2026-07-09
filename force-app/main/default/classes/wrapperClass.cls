/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : wrapperClass
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

public class wrapperClass {

	@AuraEnabled public Id accid;
	@AuraEnabled public String name;
	@AuraEnabled public String industry;
	@AuraEnabled public Integer count;

	public wrapperClass(Account acc, Integer cou){
		this.accid = acc.id;
		this.name = acc.name;
		this.industry = acc.industry;
		this.count= cou;
	}


	}