<?php namespace Dashboard\Classes;

use Cms\Models\MaintenanceSetting;
use Dashboard\Classes\ReportData;
use Dashboard\Classes\ReportFetchDataResult;
use Dashboard\Classes\ReportFetchData;
use Dashboard\Classes\ReportDataSourceBase;
use BackendAuth;
use Backend;

/**
 * CmsStatusDataSource providing information about the website status.
 *
 * @package october\dashboard
 * @author Alexey Bobkov, Samuel Georges
 */
class CmsStatusDataSource extends ReportDataSourceBase
{
    /**
     * @var string DIMENSION_CMS_INFORMATION
     */
    const DIMENSION_CMS_INFORMATION = 'indicator@cms_information';

    /**
     * __construct
     */
    public function __construct()
    {
        ReportData::addIndicatorMetrics(
            $this
                ->addCalculatedDimension(
                    self::DIMENSION_CMS_INFORMATION,
                    "Website status information"
                )
                ->setDefaultWidgetConfig([
                    'icon' => 'ph ph-power',
                    'title' => __("Website Status"),
                    'link_text' => __("Manage status")
                ])
        );
    }

    /**
     * fetchData
     */
    protected function fetchData(ReportFetchData $data): ReportFetchDataResult
    {
        $maintenance = MaintenanceSetting::get('is_enabled');
        $value = $maintenance
            ? __("Maintenance")
            : __("Online");

        $iconStatus = $maintenance
            ? ReportData::INDICATOR_ICON_STATUS_IMPORTANT
            : ReportData::INDICATOR_ICON_STATUS_SUCCESS;

        $row = $this->makeResultRow($data->dimension, [
            ReportData::METRIC_VALUE => $value,
            ReportData::METRIC_INDICATOR_ICON_STATUS => $iconStatus,
            ReportData::METRIC_LINK_ENABLED => BackendAuth::userHasAccess('cms.themes'),
            ReportData::METRIC_LINK_HREF => Backend::url('system/settings/update/october/cms/maintenance_settings')
        ]);

        return new ReportFetchDataResult($row);
    }
}
