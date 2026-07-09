import { LightningElement } from 'lwc';
export default class GrantParentBubble extends LightningElement {
    dataFromChild = '';
    fromchild(event){
        console.log(JSON.stringify(event.detail));
        this.dataFromChild = `${event.detail.mess} grandParent`;
    }
    grandparent(){
        console.log('grandparent onclock');
    }
}