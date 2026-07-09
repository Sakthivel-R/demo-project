import { LightningElement, track } from 'lwc';
export default class Eventflowb extends LightningElement {
    closehandler(event){
        console.log('closehandler'+event.detail);
    }

}