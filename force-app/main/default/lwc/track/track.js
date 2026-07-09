import { LightningElement, track } from 'lwc';

export default class Track extends LightningElement {
    fullname="demo for track"
    changeHandler(event){
        this.fullname = event.target.value
    }

    @track obje={
        city : "kumbakonam",
        postcode : '612001'
    }
    objectHandler(event){
        this.obje.city = event.target.value
    }

    @track object={
        city : "kumbakonam",
        postcode : '612001'
    }
    objectHandlerone(event){
        this.object = {...this.object, 'city':event.target.value}
    }
}