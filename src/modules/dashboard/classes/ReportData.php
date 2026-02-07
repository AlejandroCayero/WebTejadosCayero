<?php namespace Dashboard\Classes;

/**
 * ReportData defines common report metrics and helpers
 *
 * @package october\dashboard
 * @author Alexey Bobkov, Samuel Georges
 */
class ReportData
{
    const INDICATOR_ICON_STATUS_INFO = 'info';
    const INDICATOR_ICON_STATUS_SUCCESS = 'success';
    const INDICATOR_ICON_STATUS_IMPORTANT = 'important';
    const INDICATOR_ICON_STATUS_DISABLED = 'disabled';
    const INDICATOR_ICON_STATUS_WARNING = 'warning';

    const METRIC_INDICATOR_ICON_STATUS = 'icon_status';
    const METRIC_INDICATOR_ICON_COMPLICATION = 'icon_complication';

    const METRIC_VALUE = 'value';
    const METRIC_LINK_ENABLED = 'link_enabled';
    const METRIC_LINK_HREF = 'link_href';

    /**
     * @var string INDICATOR_HREF_POPUP specifies a special type of the Indicator widget link which opens a popup.
     * The data for the popup is requested from the data source's onGetPopupData
     * method, which must return an array with the `title` and `content` elements.
     */
    const INDICATOR_HREF_POPUP = 'popup';

    const INDICATOR_ICON_COMPLICATION_UP = 'up';

    /**
     * addIndicatorMetrics adds common indicator widget metrics to a dimension.
     */
    public static function addIndicatorMetrics(ReportDimension $dimension)
    {
        $dimension
            ->addCalculatedMetric(ReportData::METRIC_VALUE, "Value")
            ->addCalculatedMetric(ReportData::METRIC_INDICATOR_ICON_STATUS, "Indicator Icon Status")
            ->addCalculatedMetric(ReportData::METRIC_INDICATOR_ICON_COMPLICATION, "Indicator Icon Complication")
            ->addCalculatedMetric(ReportData::METRIC_LINK_ENABLED, "Link Enabled")
            ->addCalculatedMetric(ReportData::METRIC_LINK_HREF, "Link URL");
    }
}
