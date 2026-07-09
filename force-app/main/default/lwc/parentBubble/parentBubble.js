import { LightningElement } from 'lwc';
export default class ParentBubble extends LightningElement {
    message = 'sak';
    datames = '';

    parentcustom(event){
        console.log('Parent: received event', JSON.stringify(event.detail));
        this.message = event.detail.mess;
        this.datames = event.detail.data;
    }
}