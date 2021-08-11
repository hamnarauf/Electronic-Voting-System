//slider
const remove = document.querySelector("#removeButton");
const register = document.querySelector("#registerButton");
const form1 = document.querySelector(".container .form1");
const form2 = document.querySelector(".container .form2");
const overlay_container = document.querySelector(
        ".container .overlay-container"
        );
const overlay = document.querySelector(
        ".container .overlay-container .overlay"
        );

remove.addEventListener("click", () => {
    overlay_container.style.transform = "translateX(100%)";
    overlay.style.transform = "translateX(-50%)";
    form1.classList.add("active");
    form2.classList.remove("active");
});
register.addEventListener("click", () => {
    overlay_container.style.transform = "translateX(0)";
    overlay.style.transform = "translateX(0)";
    form2.classList.add("active");
    form1.classList.remove("active");
});


// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
    'use strict';

    window.addEventListener('load', function () {
        var form = document.getElementById('register');
        form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    }, false);
})();

//JavaScript for disabling form2 submissions if there are invalid fields
(function () {
    'use strict';

    window.addEventListener('load', function () {
        var form = document.getElementById('remove');
        form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    }, false);
})();