document.addEventListener('DOMContentLoaded', function () {
    function updateSummary() {
        console.log('Updating summary');

        const selectedCategories = Array.from(document.querySelectorAll('input[name="categories"]:checked')).map(function (checkbox) {
            const labelElement = checkbox.closest('label');
            const descriptionElement = labelElement ? labelElement.querySelector('.description') : null;
            return descriptionElement ? descriptionElement.textContent.trim() : 'Brak opisu';
        }).join(', ');

        const summaryCategoriesElement = document.getElementById('summaryCategories');
        if (summaryCategoriesElement) {
            summaryCategoriesElement.textContent = selectedCategories;
        }

        const selectedInstitutionElement = document.querySelector('input[name="institution.id"]:checked');
        console.log('Selected institution element:', selectedInstitutionElement);
        if (selectedInstitutionElement) {
            const labelElement = selectedInstitutionElement.closest('label');
            console.log('Label element:', labelElement);
            const titleElement = labelElement ? labelElement.querySelector('.title') : null;
            console.log('Title element:', titleElement);
            const selectedInstitution = titleElement ? titleElement.textContent.trim() : 'Brak tytułu';
            const summaryInstitutionElement = document.getElementById('summaryInstitution');
            if (summaryInstitutionElement) {
                summaryInstitutionElement.textContent = selectedInstitution;
            }

            const summaryInstitutionNameElement = document.getElementById('summaryInstitutionName');
            if (summaryInstitutionNameElement) {
                summaryInstitutionNameElement.textContent = `Przekazano do fundacji ${selectedInstitution}`;
            } else {
                console.log('Element summaryInstitutionName nie został znaleziony');
            }
        } else {
            console.log('Nie wybrano żadnej instytucji');
        }

        const summaryStreetElement = document.getElementById('summaryStreet');
        if (summaryStreetElement) {
            summaryStreetElement.textContent = document.querySelector('input[name="street"]').value || 'Brak danych';
        }

        const summaryCityElement = document.getElementById('summaryCity');
        if (summaryCityElement) {
            summaryCityElement.textContent = document.querySelector('input[name="city"]').value || 'Brak danych';
        }

        const summaryZipCodeElement = document.getElementById('summaryZipCode');
        if (summaryZipCodeElement) {
            summaryZipCodeElement.textContent = document.querySelector('input[name="zipCode"]').value || 'Brak danych';
        }

        const summaryPickUpDateElement = document.getElementById('summaryPickUpDate');
        if (summaryPickUpDateElement) {
            summaryPickUpDateElement.textContent = document.querySelector('input[name="pickUpDate"]').value || 'Brak danych';
        }

        const summaryPickUpTimeElement = document.getElementById('summaryPickUpTime');
        if (summaryPickUpTimeElement) {
            summaryPickUpTimeElement.textContent = document.querySelector('input[name="pickUpTime"]').value || 'Brak danych';
        }

        const summaryPickUpCommentElement = document.getElementById('summaryPickUpComment');
        if (summaryPickUpCommentElement) {
            summaryPickUpCommentElement.textContent = document.querySelector('textarea[name="pickUpComment"]').value || 'Brak uwag';
        }

        const summaryBagsElement = document.getElementById('summaryBags');
        if (summaryBagsElement) {
            const quantity = document.querySelector('input[name="quantity"]').value || '0';
            summaryBagsElement.textContent = `Przekazano ${quantity} worków`;
        }
    }

    function updateStep(step) {
        document.getElementById('currentStep').textContent = step;
        document.querySelectorAll('.step-description').forEach(function (description) {
            if (description.classList) {
                description.classList.remove('active');
            }
        });
        const newActiveStep = document.querySelector(`.step-description[data-step="${step}"]`);
        if (newActiveStep && newActiveStep.classList) {
            newActiveStep.classList.add('active');
        }
    }

    document.querySelectorAll('.next-step').forEach(function (button) {
        button.addEventListener('click', function () {
            console.log('Next button clicked');
            const currentStep = this.closest('div[data-step]');
            const nextStep = currentStep.nextElementSibling;
            if (nextStep) {
                currentStep.classList.remove('active');
                nextStep.classList.add('active');
                const stepNumber = nextStep.getAttribute('data-step');
                console.log('Moved to step:', stepNumber);
                updateStep(stepNumber);
                if (stepNumber == '5') {
                    updateSummary();
                }
            }
        });
    });

    document.querySelectorAll('.prev-step').forEach(function (button) {
        button.addEventListener('click', function () {
            console.log('Prev button clicked');
            const currentStep = this.closest('div[data-step]');
            const prevStep = currentStep.previousElementSibling;
            if (prevStep) {
                currentStep.classList.remove('active');
                prevStep.classList.add('active');
                const stepNumber = prevStep.getAttribute('data-step');
                console.log('Moved to step:', stepNumber);
                updateStep(stepNumber);
            }
        });
    });
});
