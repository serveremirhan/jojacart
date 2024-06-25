Array.from(document.getElementsByClassName("showbtn")).map((btn) => {
    btn.addEventListener("click", () => {
        console.log("click")
        document.getElementById("sidemenu").classList.toggle("show")
    })
})

document.getElementById("profile_dropdown").addEventListener("click",()=>{
    document.getElementsByClassName("profilre_dropdown")[0].classList.toggle("toggle_profile_dropdown")
})

/* Adverd Card */

const images = [
    'img/reklam1.jpg',	
    'img/reklam2.jpg',
    'img/reklam3.jpg'
    
  ];
  
  let currentIndex = 0;
  
  setInterval(() => {
    currentIndex = (currentIndex + 1) % images.length;
    document.getElementById('advert-image').src = images[currentIndex];
  }, 5000); 


/*   ADMİN PANEL    */

// Resim önizleme fonksiyonu
function previewImage(event) {
    var reader = new FileReader();
    reader.onload = function() {
        var output = document.getElementById('image-preview');
        output.src = reader.result;
        output.style.display = 'block';
    };
    reader.readAsDataURL(event.target.files[0]);
}

function addProduct() {
    alert('Ürün eklendi!');
}

// Sepet Toplam Fiyat
function updateTotalPrice() {
    var total = 0;
    var prices = document.querySelectorAll('.item-price');
    prices.forEach(function(price) {
        total += parseFloat(price.textContent.replace(' TL', ''));
    });
    document.getElementById('total-price').textContent = 'Toplam: ' + total + ' TL';
}

document.addEventListener('DOMContentLoaded', function() {
    updateTotalPrice();

    deleteIcons.forEach(function(icon) {
        icon.addEventListener('click', function() {
            var orderItem = this.closest('.order-item');
            if (orderItem) {
                orderItem.remove();
                updateTotalPrice();
            }
        });
    });
});

// Basarili Sayfasi Yönlendirme

function odemeekrani() {
    // Başka bir sayfaya yönlendirme işlemi
    window.location.href = 'orderdetails.jsp';
}
function basarilisiparis() {
    // Başka bir sayfaya yönlendirme işlemi
    window.location.href = 'successfull.jsp';
}


// Ödeme Ekranı
const cardNumber = document.getElementById("card-number");
const cardHolderName = document.getElementById("card-holder-name");
const cardNameInput = document.getElementById("card-name-input");
const displayValidity = document.getElementById("validity");
const validityInput = document.getElementById("validity-input");
const cardNumberDisplay = document.querySelectorAll(".card-number-display");
const cvvInput = document.getElementById("cvv");
const cvvDisplay = document.getElementById("cvv-display");
let currentSpanIndex = 0;
cardNumber.addEventListener("input", () => {
  const inputNumber = cardNumber.value.replace(/\D/g, "");
  cardNumber.value = cardNumber.value.slice(0, 16).replace(/\D/g, "");
  for (let i = 0; i < cardNumberDisplay.length; i++) {
    if (i < inputNumber.length) {
      cardNumberDisplay[i].textContent = inputNumber[i];
    } else {
      cardNumberDisplay[i].textContent = "_";
    }
  }
  if (inputNumber.length <= cardNumberDisplay.length) {
    currentSpanIndex = inputNumber.length;
  } else {
    currentSpanIndex = cardNumberDisplay.length;
  }
});
cardNameInput.addEventListener("input", () => {
  if (cardNameInput.value.length < 1) {
    cardHolderName.innerText = "Your Name Here";
  } else if (cardNameInput.value.length > 30) {
    cardNameInput.value = cardNameInput.value.slice(0, 30);
  } else {
    cardHolderName.innerText = cardNameInput.value;
  }
});
validityInput.addEventListener("input", () => {
  const inputString = validityInput.value;
  if (inputString.length < 1) {
    displayValidity.innerText = "06/28";
    return false;
  }
  const parts = inputString.split("-");
  const year = parts[0].slice(2);
  const month = parts[1];
  //Final formatted string
  const formattedString = `${month}/${year}`;
  displayValidity.innerText = formattedString;
});
//cvv
cvvInput.addEventListener("input", () => {
  const userInput = cvvInput.value;
  const sanitizedInput = userInput.slice(0, 3);
  const numericInput = sanitizedInput.replace(/\D/g, "");
  cvvInput.value = numericInput;
  cvvDisplay.innerText = numericInput;
});
//Flip
cvvInput.addEventListener("click", () => {
  document.getElementById("card").style.transform = "rotateY(180deg)";
});
//Reflip card
document.addEventListener("click", () => {
  if (document.activeElement.id != "cvv") {
    document.getElementById("card").style.transform = "rotateY(0deg)";
  }
});
window.onload = () => {
  cvvInput.value = "";
  validityInput.value = "";
  cardNameInput.value = "";
  cardNumber.value = "";
};

function redirectToPage(event) {
            event.preventDefault();
            const paymentMethod = document.getElementById('floating-payment-method').value;
            let url = '';

            switch (paymentMethod) {
                case 'credit-card':
                    url = 'payment.jsp';
                    break;
                case 'cash':
                    url = 'successfull.jsp';
                    break;
            }

            window.location.href = url;
        }