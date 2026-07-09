import { LightningElement } from 'lwc';

export default class ParentToChild extends LightningElement {
    value=20
    numberHandler(event){
        this.value = event.target.value
    }
}