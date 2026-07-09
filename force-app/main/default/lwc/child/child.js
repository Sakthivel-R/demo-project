import { LightningElement,track } from 'lwc';
export default class Child extends LightningElement {
    handleClick(){
        const evet= new CustomEvent('childclick',{
            detail:{
                message : 'msg from child'
            },
            bubbles: false,
            composed: true
        });
        this.dispatchEvent(evet);
    }

}