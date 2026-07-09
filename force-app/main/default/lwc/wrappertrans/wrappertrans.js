import { LightningElement,wire } from 'lwc';
import doSomething from '@salesforce/apex/wrapperuse.doSomething'
export default class Wrappertrans extends LightningElement {

    accounts;
    error;
    columns=[
        {label:'accountname', fieldName:'name', type:'text'}
    ];

    @wire(doSomething)
    wrap({data,error}){
        if(data){
            this.accounts = data;
        }else{
            this.error = error;
        }
    }


}