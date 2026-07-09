import { LightningElement } from 'lwc';
import admin_Name from "@salesforce/schema/admin_1__c.Name";
import admin_Support from "@salesforce/schema/admin_1__c.Support_option__c";
import admin_phone from "@salesforce/schema/admin_1__c.phone__c";
import { createRecord } from 'lightning/uiRecordApi';
//import { updateRecord } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';

export default class RecordForm extends LightningElement {
    fields={name:admin_Name,
    support:admin_Support,
    phone:admin_phone};
    /*validateFields() {
        this.template.querySelectorAll('lightning-input-field').forEach(element => {
            element.reportValidity();
        });
    }*/
    
    handleReset(){ 
        const inputFields = this.template.querySelectorAll('lightning-input-field')
        if(inputFields){ 
            Array.from(inputFields).forEach(field=>{ 
                field.reset()
            })
        }
    }
   /* handleSubmit(event) {     
        event.preventDefault();
        const fields = event.detail.fields;
        createRecord({admin_1__c, fields})
            .then(() => {return refreshApex(this.wiredMetricsResult);
            });
        this.showForm = false;
    }*/
}