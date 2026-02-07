<?php namespace Dashboard\Classes;

use Backend\Classes\WidgetBase;
use Dashboard\Classes\DashReport;

/**
 * ReportWidgetBase is a base class for static widgets used on dashboards
 *
 * @package october\dashboard
 * @author Alexey Bobkov, Samuel Georges
 */
abstract class ReportWidgetBase extends WidgetBase
{
    use \System\Traits\PropertyContainer;

    /**
     * @var DashReport dashReport object containing general dash report information.
     */
    protected $dashReport;

    /**
     * __construct
     */
    public function __construct($controller, $dashReport, $properties = [])
    {
        $this->dashReport = $dashReport;
        $this->properties = $this->validateProperties($properties);

        // Ensure the provided alias (if present) takes effect as the widget configuration is
        // not passed to the WidgetBase constructor which would normally take care of that
        if (!isset($this->alias)) {
            $this->alias = $properties['alias'] ?? $this->defaultAlias;
        }

        parent::__construct($controller);
    }
}
