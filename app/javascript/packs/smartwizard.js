import { end } from "@popperjs/core";

$(document).ready(function(){

  // Toolbar extra buttons
    const btnFinish = $('<button></button>').text('Confirm')
            .addClass('btn-green-primary d-none confirm-btn')
            .on('click', function () {
                if (!$(this).hasClass('d-none')) {
                    var elmForm = $('form-inputs');
                    elmForm.submit();
                }
            });

    $("#smartwizard").on("showStep", function () {
      const confirm = document.querySelector('.confirm-btn')
      const parent = document.querySelector('.toolbar-bottom')
      const next = document.querySelector('.sw-btn-next')
      // Enable finish button only on last step
      if (window.location.href.includes('step-3')) {
        confirm.classList.remove('d-none')
        // next.classList.remove('disabled')
        // next.style.display = "none !important";
      } else {
        confirm.classList.add('d-none')
      }
    });


    $('#smartwizard').smartWizard({
      selected: 0, // Initial selected step, 0 = first step
      theme: 'dots', // theme for the wizard, related css need to include for other than default theme
      justified: true, // Nav menu justification. true/false
      darkMode:false, // Enable/disable Dark Mode if the theme supports. true/false
      autoAdjustHeight: true, // Automatically adjust content height
      cycleSteps: false, // Allows to cycle the navigation of steps
      backButtonSupport: true, // Enable the back button support
      enableURLhash: true, // Enable selection of the step based on url hash
      transition: {
        animation: 'slide-horizontal', // Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing
        speed: '400', // Transion animation speed
        easing:'' // Transition animation easing. Not supported without a jQuery easing plugin
      },
      toolbarSettings: {
        toolbarPosition: 'bottom', // none, top, bottom, both
        toolbarButtonPosition: 'right', // left, right, center
        showNextButton: true, // show/hide a Next button
        showPreviousButton: true, // show/hide a Previous button
        toolbarExtraButtons: [btnFinish] // Extra buttons to show on toolbar, array of jQuery input/buttons elements
      },
      anchorSettings: {
      anchorClickable: true, // Enable/Disable anchor navigation
      enableAllAnchors: false, // Activates all anchors clickable all times
      markDoneStep: true, // Add done state on navigation
      markAllPreviousStepsAsDone: true, // When a step selected by url hash, all previous steps are marked done
      removeDoneStepOnNavigateBack: false, // While navigate back done step after active step will be cleared
      enableAnchorOnDoneStep: true // Enable/Disable the done steps navigation
    },
    keyboardSettings: {
      keyNavigation: true, // Enable/Disable keyboard navigation(left and right keys are used if enabled)
      keyLeft: [37], // Left key code
      keyRight: [39] // Right key code
    },
    lang: { // Language variables for button
      next: 'Next',
      previous: 'Previous'
    },
    disabledSteps: [], // Array Steps disabled
    errorSteps: [], // Highlight step with errors
    hiddenSteps: [] // Hidden steps
  });

});
