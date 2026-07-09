import { LightningElement, api, wire } from 'lwc';
import getcontacts from '@salesforce/apex/AccountContactController.getcontacts';
export default class Childtoparent extends LightningElement {
    @api accountId;
    contact;

    @wire(getcontacts,{accid: '$accountId'})
    contactdetails({data, error}){
        if(data){
            this.contact = data;
        }else{
            console.error(error);
        }
    }
}