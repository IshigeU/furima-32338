function count (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
     console.log(addTaxDom);

    const profit = document.getElementById("profit")
    const value_result = inputValue * 0.1
    console.log(value_result)
    profit.innerHTML = (Math.floor(inputValue - value_result));
      console.log(profit);
  });
}; 
window.addEventListener('load', count);