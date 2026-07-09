import { LightningElement, track } from 'lwc';
import createCustomerInfo from '@salesforce/apex/CustomerInformation.createCustomerInfo';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CustomerInfoProject extends LightningElement {
   @track fName='';
    @track lName='';
    @track age;
    @track gender='';

    genderOption=[
        {lable:'Woman', value:'Woman'},
        {lable:'Man', value:'Man'},
        {lable:'Transgender', value:'Transgender'},
    ]
    handleFirstNameChange(event){
        this.fName = event.target.value;
    }
    handleLastNameChange(event){
        this.lName = event.target.value;
    }
    handleAgeChange(event){
        this.age = parseInt(event.target.value, 10);
    }
    handleGenderChange(event){
        this.gender = event.target.value;
    }
    handleSubmit(){
        createCustomerInfo({
            fName: this.fName,
            lName: this.lName,
            age: this.age,
            gender: this.gender
        }).then(()=>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title : 'Success',
                    message : 'Form Move to next step',
                    variant : 'success'
                })
            );
            this.fName='';
            this.lName='';
            this.age=null;
            this.gender = '';
        })
        .catch(error=>{
            this.dispatchEvent(
                new ShowToastEvent({
                title: 'Error',
                message : 'error.body.message',
                variant : 'error'
            })
            );
        });
    }
}