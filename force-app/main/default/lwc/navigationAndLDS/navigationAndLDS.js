import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';

export default class NavigationAndLDS extends NavigationMixin(LightningElement) {
    navigateToHome() {
        console.log('hi');
        this[NavigationMixin.Navigate](
            { type: 'standard__namedPage', 
            attributes: {
                 pageName: 'home' }
            });
    }
    navigatetonewrecord(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account', // The API name of the object
                actionName: 'new'         // Action for creating a new record
            }
        })
    }
    
    navigatetopredefined(){
        const valueofpre= encodeDefaultFieldValues({
            Name: 'New Corporate Account'
        });
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account', // The API name of the object
                actionName: 'new'         // Action for creating a new record
            },
            state:{
                defaultFieldValues : valueofpre
            }
        })
    }
}