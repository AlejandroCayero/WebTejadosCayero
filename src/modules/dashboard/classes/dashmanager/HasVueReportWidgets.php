<?php namespace Dashboard\Classes\DashManager;

use SystemException;
use Backend\Classes\Controller;
use Dashboard\Classes\VueReportWidgetBase;

/**
 * HasVueReportWidgets
 *
 * @package october\dashboard
 * @author Alexey Bobkov, Samuel Georges
 */
trait HasVueReportWidgets
{
    /**
     * @var array vueReportWidgets
     */
    protected $vueReportWidgets;

    /**
     * listVueReportWidgetClasses returns class names and registration parameters of registered dashboard widgets.
     */
    public function listVueReportWidgetClasses(): array
    {
        if ($this->vueReportWidgets === null) {
            $this->listVueReportWidgets();
        }

        return array_keys($this->vueReportWidgets);
    }

    /**
     * listReportWidgets returns a list of registered report widgets.
     * @return array Array keys are class names.
     */
    public function listVueReportWidgets()
    {
        if ($this->vueReportWidgets !== null) {
            return $this->vueReportWidgets;
        }

        $widgets = [];
        foreach ($this->widgetManager->listReportWidgets() as $className => $widgetInfo) {
            if (is_subclass_of($className, VueReportWidgetBase::class)) {
                $widgets[$className] = $widgetInfo;
            }
        }

        return $this->vueReportWidgets = $widgets;
    }

    /**
     * isVueReportWidget
     */
    public function isVueReportWidget($widgetCodeOrClass): bool
    {
        $widgetClass = $this->widgetManager->resolveReportWidget($widgetCodeOrClass);

        return is_subclass_of($widgetClass, VueReportWidgetBase::class);
    }

    /**
     * getWidget returns a dashboard widget instance by its class name.
     * @throws SystemException if the provided class name is not a subclass Dashboard\Classes\VueReportWidgetBase.
     * @param string $className A dashboard widget class name.
     * @param Controller $controller Parent controller instance.
     * @return ?VueReportWidgetBase Returns the dashboard widget instance or null.
     */
    public function getVueReportWidget(string $className, Controller $controller): ?VueReportWidgetBase
    {
        if ($this->vueReportWidgets === null) {
            $this->listVueReportWidgets();
        }

        if (!array_key_exists($className, $this->vueReportWidgets)) {
            return null;
        }

        if (!is_subclass_of($className, VueReportWidgetBase::class)) {
            throw new SystemException("The provided class is not a dashboard widget: {$className}");
        }

        return new $className($controller);
    }
}
