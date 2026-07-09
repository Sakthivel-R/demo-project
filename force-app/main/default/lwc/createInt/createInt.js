import { LightningElement,api } from 'lwc';
export default class CreateInt extends LightningElement {
@api recordId;    
connectedCallback() {
    console.log(this.recordId);
}

}