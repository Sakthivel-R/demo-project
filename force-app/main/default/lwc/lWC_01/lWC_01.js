import { LightningElement } from 'lwc';
export default class LWC_01 extends LightningElement {
    myQuestion=[
        {
            id:"Question1",
            question:"first letter in alpha",
            answer:{
                a:"f",
                b:"z",
                c:"a"
            },
            CorrectAnswer:"c"
        },
        {
            id:"Question2",
            question:"last letter in alpha",
            answer:{
                a:"f",
                b:"z",
                c:"a"
            },
            CorrectAnswer:"b"
        },
        {
            id:"Question3",
            question:"which letter is not vowel",
            answer:{
                a:"e",
                b:"h",
                c:"a"
            },
            CorrectAnswer:"b"
        }
    ]

}