window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  // console.log(inputValue);
  const addTaxDom = document.getElementById('profit');
    addTaxDom.innerHTML = Math.floor(inputValue - (inputValue * 0.1))
  
    })
});