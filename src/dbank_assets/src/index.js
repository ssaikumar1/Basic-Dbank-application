import {dbank} from "../../declarations/dbank";

 window.addEventListener("load", async function() {
   await update();
 });

 document.querySelector("form").addEventListener("submit", async function(event){
  event.preventDefault();
  //console.log("submitted.");
  const button = event.target.querySelector("#submit-btn");
  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("Withdraw-amount").value);

  button.setAttribute("disabled",true);
  if(document.getElementById("input-amount").value.length !=0){

  await dbank.topup(inputAmount);
  }
  if(document.getElementById("Withdraw-amount").value.length !=0){

    await dbank.withdraw(outputAmount);
    }

    await dbank.compound();

    update();
  
  

  document.getElementById("input-amount").value="";
  document.getElementById("Withdraw-amount").value="";

  button.removeAttribute("disabled");
  

 });

 async function update() {
  const currentvalue= await dbank.checkBalance();
  console.log(currentvalue)
  console.log(typeof currentvalue)
  document.getElementById("value").innerText = Math.round(currentvalue*100)/100;


 };

 