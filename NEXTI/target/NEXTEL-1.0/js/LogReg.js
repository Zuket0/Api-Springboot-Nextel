// OJO PASSWORD
            document.querySelectorAll(".toggle-password").forEach(icon => {
                icon.addEventListener("click", function () {
                    let passwordInput = this.previousElementSibling; // Selecciona el input anterior
                    if (passwordInput.type === "password") {
                        passwordInput.type = "text";
                        this.classList.remove("fa-eye");
                        this.classList.add("fa-eye-slash");
                    } else {
                        passwordInput.type = "password";
                        this.classList.remove("fa-eye-slash");
                        this.classList.add("fa-eye");
                    }
                });
            });
            

// ICON MENU SMALL DEVICE
                // Seleccionamos los elementos
                const menuToggle = document.querySelector('.menu-toggle');
                const navbar = document.querySelector('.navbar');

                // Agregamos el evento click
                menuToggle.addEventListener('click', () => {
                    navbar.classList.toggle('active'); // Alternar la clase 'active'
                });
                
                
// SESION?
        function toggleMenu() {
        var dropdown = document.getElementById("userDropdown");
        dropdown.classList.toggle("show");
    }

    // Cierra el menú si se hace clic fuera de él
    window.onclick = function(event) {
        if (!event.target.matches('.user-icon')) {
            var dropdowns = document.getElementsByClassName("dropdown-menu");
            for (var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    };
    
// STEPS OF REGISTER

   // Min - Max valido
   function limitLength(element, minLength, maxLength) {
            let value = element.value;
            if (value.length > maxLength) {
                element.value = value.slice(0, maxLength);
            }
            validateInputs(element.closest(".step"));
        }

        function validateInputs(stepElement) {
            let inputs = stepElement.querySelectorAll("input[required]");
            let nextButton = stepElement.querySelector(".next-button");
            let allValid = Array.from(inputs).every(input => {
                let minLength = parseInt(input.getAttribute("minlength")) || 1;
                return input.value.length >= minLength;
            });
            nextButton.disabled = !allValid;
        }

        document.addEventListener("DOMContentLoaded", function () {
            let currentStep = 1;
            function showStep(step) {
                document.querySelectorAll(".step").forEach(div => div.style.display = "none");
                let stepElement = document.getElementById("step" + step);
                if (stepElement) {
                    stepElement.style.display = "block";
                    validateInputs(stepElement);
                }
            }
            function nextStep() {
                if (currentStep < 3) {
                    currentStep++;
                    showStep(currentStep);
                }
            }
            showStep(1);
            document.querySelectorAll("input[required]").forEach(input => {
                input.addEventListener("input", function () {
                    limitLength(this, parseInt(this.getAttribute("minlength")) || 1, parseInt(this.getAttribute("maxlength")) || 100);
                });
            });
            document.querySelectorAll(".next-button").forEach(button => {
                button.addEventListener("click", nextStep);
            });
        });