import { LightningElement } from 'lwc';
export default class WireAdapterParent extends LightningElement {
    valuefromparent = '';
    handelerofInput(event){
        this.valuefromparent = event.target.value;
    }

}