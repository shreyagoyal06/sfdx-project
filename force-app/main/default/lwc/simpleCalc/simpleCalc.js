import { LightningElement,track } from 'lwc';

export default class SimpleCalc extends LightningElement {
    @track currentresult;
    @track check=false;

     @track previousresult=[];
     FirstNumber;
     SecondNumber;

    numbHandler(event){
        const number = event.target.name;
        if(number==="FirstNumber"){
            this.FirstNumber=event.target.value;
        }
        else if(number==="SecondNumber"){
            this.SecondNumber=event.target.value;
        }
    }

    addHandler(){
        const firstN=parseInt(this.FirstNumber);
        const SecondN=parseInt(this.SecondNumber);

        this.currentresult=`Result of ${firstN} + ${SecondN} is ${firstN + SecondN}`;
        this.previousresult.push(this.currentresult);
    }
    subHandler(){
        const firstN=parseInt(this.FirstNumber);
        const SecondN=parseInt(this.SecondNumber);

        this.currentresult=`Result of ${firstN} - ${SecondN} is ${firstN - SecondN}`;
        this.previousresult.push(this.currentresult);

    }
    multiplyHandler(){
        const firstN=parseInt(this.FirstNumber);
        const SecondN=parseInt(this.SecondNumber);

        this.currentresult=`Result of ${firstN} x ${SecondN} is ${firstN * SecondN}`;
        this.previousresult.push(this.currentresult);
    }
    divideHandler(){
        const firstN=parseInt(this.FirstNumber);
        const SecondN=parseInt(this.SecondNumber);

        this.currentresult=`Result of ${firstN} / ${SecondN} is ${firstN / SecondN}`;
        this.previousresult.push(this.currentresult);
    }

    changeToggle(event){
        this.check=event.target.checked;
    }
}