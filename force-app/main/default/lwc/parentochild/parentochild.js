import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountContactController.getAccounts';
export default class Parentochild extends LightningElement {
    accounts;
    selectedAccountId;
    
    @wire(getAccounts)
    accountdata({data, error}){
        if(data){
            this.accounts= data;
        }else{
            console.error(error);
        }
    }

    selectedAccountId(event){
        event.preventDefault();
        this.selectedAccountId = event.target.dataset.id;
        console.log('OUTPUT : ',event.target.dataset.id);
    }

}