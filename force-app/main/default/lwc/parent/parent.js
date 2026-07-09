import { LightningElement } from 'lwc';
export default class Parent extends LightningElement {
    a = 'sak';
    childhandler(event){
        console.log(event.detail.message);
    }
    parentclick(){
        console.log('parent handler'+ this.a);
    }

}