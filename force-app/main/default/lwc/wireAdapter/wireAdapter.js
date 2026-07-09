import { LightningElement,api,wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import {getObjectInfo} from 'lightning/uiObjectInfoApi';
import Account from '@salesforce/schema/Account'
export default class WireAdapter extends LightningElement {
    message = 'hoi';
    @api
    set inputHandeler(value){
        this.message =  value+ 'dai';
    }

    get inputHandeler(){
        return  this.message;
    }

    @wire(getRecord,{recordId:'001J400000aqy8DIAQ',fields:['Account.Name']})
    fun({data,error}){
        if(data){
            console.log(data);
        }else if(error){
            console.error('error1'+ error);
        }
    }

    @wire(getObjectInfo,{objectApiName: Account})
    dat({data,error}){
        if(data){
            console.log(data);
        }else if(error){
            console.error(error);
        }
    }

}