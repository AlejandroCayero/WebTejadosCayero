<?php namespace Dashboard\VueComponents;

use Backend\Classes\VueComponentBase;

/**
 * Dashboard top-level component
 *
 * @package october\dashboard
 * @author Alexey Bobkov, Samuel Georges
 */
class Dashboard extends VueComponentBase
{
    /**
     * @var array require other components
     */
    protected $require = [
        \Backend\VueComponents\DropdownMenu::class,
        \Backend\VueComponents\Modal::class,
        \Backend\VueComponents\LoadingIndicator::class
    ];

    /**
     * registerSubcomponents
     */
    protected function registerSubcomponents()
    {
        $this->registerSubcomponent('dashboard-selector');
        $this->registerSubcomponent('interval-selector');
        $this->registerSubcomponent('report');
        $this->registerSubcomponent('report-row');
        $this->registerSubcomponent('period-diff');
        $this->registerSubcomponent('report-widget');

        $this->registerSubcomponent('widget-static');
        $this->registerSubcomponent('widget-indicator');
        $this->registerSubcomponent('widget-chart');
        $this->registerSubcomponent('widget-table');
        $this->registerSubcomponent('widget-section-title');
        $this->registerSubcomponent('widget-text-notice');
        $this->registerSubcomponent('widget-error');
    }

    /**
     * loadAssets adds component specific asset files. Use $this->addJs() and $this->addCss()
     * to register new assets to include on the page.
     * The default component script and CSS file are loaded automatically.
     * @return void
     */
    protected function loadAssets()
    {
        $this->addJsBundle('/modules/backend/assets/js/ph-icons-list.js');
        $this->addJsBundle('/modules/backend/assets/vendor/chartjs/chart.umd.js');
        $this->addJsBundle('/modules/backend/assets/vendor/chartjs-adapter-moment/chartjs-adapter-moment.min.js');

        $this->addJsBundle('/modules/dashboard/assets/js/classes/Helpers.js');
        $this->addJsBundle('/modules/dashboard/assets/js/classes/DataSource.js');
        $this->addJsBundle('/modules/dashboard/assets/js/classes/Calendar.js');
        $this->addJsBundle('/modules/dashboard/assets/js/classes/InspectorConfigurator.js');
        $this->addJsBundle('/modules/dashboard/assets/js/classes/Sizing.js');
        $this->addJsBundle('/modules/dashboard/assets/js/classes/Dragging.js');
        $this->addJsBundle('/modules/dashboard/assets/js/classes/Reordering.js');
        $this->addJsBundle('/modules/dashboard/assets/js/classes/DataHelper.js');
        $this->addJsBundle('/modules/dashboard/assets/js/classes/WidgetManager.js');

        $this->addJsBundle('js/widget-base.js');
    }
}
