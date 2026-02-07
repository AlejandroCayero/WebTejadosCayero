<?php namespace Backend\Traits;

use Lang;
use Backend\Classes\FormField;
use SystemException;

/**
 * WidgetMaker Trait
 *
 * Adds widget based methods to a controller class, or a class that
 * contains a `$controller` property referencing a controller.
 *
 * @package october\backend
 * @author Alexey Bobkov, Samuel Georges
 */
trait WidgetMaker
{
    /**
     * getWidget
     */
    public function getWidget(string $name)
    {
        $controller = property_exists($this, 'controller') && $this->controller
            ? $this->controller
            : $this;

        return $controller->widget->{$name} ?? null;
    }

    /**
     * makeWidget object with the supplied configuration file.
     * @param string $class
     * @param array $widgetConfig
     * @return \Backend\Classes\WidgetBase
     */
    public function makeWidget($class, $widgetConfig = [])
    {
        $controller = property_exists($this, 'controller') && $this->controller
            ? $this->controller
            : $this;

        if (!class_exists($class)) {
            throw new SystemException(Lang::get('backend::lang.widget.not_registered', [
                'name' => $class
            ]));
        }

        return new $class($controller, $widgetConfig);
    }

    /**
     * makeFormWidget object with the supplied form field and widget configuration.
     * The fieldConfig is a field name, an array of config or a FormField object.
     * @param string $class
     * @param mixed $fieldConfig
     * @param array $widgetConfig
     * @return \Backend\Classes\FormWidgetBase
     */
    public function makeFormWidget($class, $fieldConfig = [], $widgetConfig = [])
    {
        $controller = property_exists($this, 'controller') && $this->controller
            ? $this->controller
            : $this;

        if (!class_exists($class)) {
            throw new SystemException(Lang::get('backend::lang.widget.not_registered', [
                'name' => $class
            ]));
        }

        if (is_string($fieldConfig)) {
            $fieldConfig = ['fieldName' => $fieldConfig];
        }

        if (is_array($fieldConfig)) {
            if (isset($fieldConfig['name'])) {
                $fieldConfig['fieldName'] = $fieldConfig['name'];
            }

            $formField = new FormField($fieldConfig);
            $formField->displayAs('widget', $fieldConfig);
        }
        else {
            $formField = $fieldConfig;
        }

        return new $class($controller, $formField, $widgetConfig);
    }
}
