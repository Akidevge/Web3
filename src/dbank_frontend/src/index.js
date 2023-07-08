import { dbank_backend } from "../../declarations/dbank_backend";
window.addEventListener("load",async function(){
console.log("loaded page");
Update();
})
document.querySelector("form").addEventListener("submit",async function(event){
    event.preventDefault();
    console.log("submitted");
    const button=event.target.querySelector("#submit-btn");
    button.setAttribute("disabled",true);
    const topUp=parseFloat(document.getElementById("input-amount").value);
    const withDraw=parseFloat(document.getElementById("withdrawal-amount").value);
    if(document.getElementById("input-amount").value.length!=0)
    {
        await dbank_backend.addBal(topUp);
    }
    if(document.getElementById("withdrawal-amount").value.length!=0)
    {
        await dbank_backend.withDraw(withDraw);
    }
    Update();
    button.removeAttribute("disabled")
    document.getElementById("input-amount").value="";
    document.getElementById("withdrawal-amount").value="";
})
async function Update()
{
    const currBal= await dbank_backend.checkBal();
    console.log(currBal);
    document.getElementById("value").innerHTML=Math.floor(currBal *100)/100;
};