import { LightningElement,track } from 'lwc';

export default class Test_shreya extends LightningElement {

    @track greeting='Cloud management!';

    handleChange(event){
        this.greeting=event.target.value;
    }




}