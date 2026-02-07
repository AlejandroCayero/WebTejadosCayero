+function ($) { "use strict";
    if (!$) {
        return;
    }

    var OnboardingPopup = function () {
        var $collapsedWidget = null;

        function init() {
            $collapsedWidget = $('<div class="onboarding-popup-collapsed"><div></div></div>');
            $(document.body).append($collapsedWidget);
            playCollapsedAnimation();
            initListeners();
        }

        function initListeners() {
            $collapsedWidget.on('click', onCollapsedClick)
        }

        function playCollapsedAnimation() {
            $collapsedWidget.addClass('onboarding-popup-collapse-animation-start');
            window.setTimeout(function () {
                $collapsedWidget.addClass('onboarding-popup-just-collapsed');
                window.setTimeout(function () {
                    $collapsedWidget.removeClass('onboarding-popup-just-collapsed');
                    $collapsedWidget.removeClass('onboarding-popup-collapse-animation-start');
                }, 2000);
            }, 50);
        }

        function onCollapsedClick() {
            $(document.body).addClass('onboarding-popup-visible');

            $.popup({
                handler: 'onRenewOctoberCmsLicense'
            }).one('hide.oc.popup', function() {
                setTimeout(function() {
                    $(document.body).removeClass('onboarding-popup-visible');
                    playCollapsedAnimation();
                }, 200);
            });
        }

        init();
    };

    addEventListener('page:load', function() {
        if (!$(document.body).hasClass('outer') && $.oc.backendUrl) {
            new OnboardingPopup();
        }
    });
}(jQuery);
