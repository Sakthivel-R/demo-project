import { LightningElement } from 'lwc';
export default class Greatgranparent extends LightningElement {
    valuefromChild;
    greatgrandparentHandler(){
        console.log('great grand parent onclick');
    }
    grantparenthandler(event){
        console.log('greatgrandparent' + event.detail.message);
        this.valuefromChild = event.detail.message + '  just mutate';
    }

}