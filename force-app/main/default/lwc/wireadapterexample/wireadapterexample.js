import { LightningElement, wire } from 'lwc';
import {getRecord} from 'lightning/uirecordApi';
import account_Name from '@salesforce/schema/Account.Name';
export default class Wireadapterexample extends LightningElement {
    recordid = '001J400000asIpqIAE';
    @wire(getRecord,{recordId : '$recordid', fields : [account_Name]})
    infoofid(response){
        console.log(response.data);
    }
}