import { LightningElement, track } from 'lwc';
export default class Eventflowc extends LightningElement {
    @track name='';
    @track timeout;
    inputhandler(event){
        window.clearTimeout(this.timeout)
        const value = event.target.value;
       this.timeout = window.setTimeout(()=>{
            this.name = value;
            
        },400);
        console.log(this.name);
    }
    eventfire(){
        console.log('custome event');
        const evt= new CustomEvent('event',{
            detail: this.name,
            bubbles:true,
            composed:true
        });
        this.dispatchEvent(evt);
    }
    handler(){
        console.log('bubble');
    }
    sectionhandler(){
        console.log('section');
    }

}