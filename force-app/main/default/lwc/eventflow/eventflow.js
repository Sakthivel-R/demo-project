import { LightningElement } from 'lwc';
export default class Eventflow extends LightningElement {
    handlerevent(event){
        console.log(event.detail+'grantparent');
    }
}