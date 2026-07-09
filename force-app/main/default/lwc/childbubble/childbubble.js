import { LightningElement } from 'lwc';
export default class Childbubble extends LightningElement {
    message = '';
    userdata(event){
        this.message = event.target.value;
    }
    customstart(){
        this.dispatchEvent(new CustomEvent('child',{
            detail: {
                mess : this.message,
                data : this.message + 'hi'
                },
            bubbles:false,
            composed:false
            }))
    }
    eventhandlerof(){
        console.log('hi this is bubble');
    }
}