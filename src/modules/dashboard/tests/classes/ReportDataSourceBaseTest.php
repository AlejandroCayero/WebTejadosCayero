<?php

use Dashboard\Models\ReportDataCache;
use Dashboard\Classes\ReportMetric;
use Dashboard\Classes\ReportDimension;
use Dashboard\Classes\ReportDataOrderRule;
use Dashboard\Classes\ReportDataPaginationParams;
use Dashboard\Classes\ReportFetchData;
use Dashboard\Classes\ReportFetchDataResult;
use Dashboard\Classes\ReportDataSourceBase;
use Carbon\CarbonPeriod;
use Carbon\Carbon;

class ReportDataSourceBaseTest extends TestCase
{
    public function testNonCacheableData()
    {
        $startDate = new Carbon('2023-01-01');
        $endDate = new Carbon('2023-01-03');

        $dsRange = CarbonPeriod::create($startDate, $endDate);
        $values = [
            (object)['oc_dimension' => 'product-1', 'oc_metric_metric_1' => 1],
            (object)['oc_dimension' => 'product-2', 'oc_metric_metric_1' => 2],
            (object)['oc_dimension' => 'product-3', 'oc_metric_metric_1' => 3]
        ];

        $rangesAndValues = [
            ['range' => $dsRange, 'values' => $values]
        ];

        $reportDataCacheMock = $this->mockReportDataCache();

        $reportDataCacheMock->expects($this->never())->method('getRanges');
        $reportDataCacheMock->expects($this->never())->method('putRange');

        $dataSource = $this->getDataSource(
            new ReportDimension('product', 'product', 'Product'),
            $rangesAndValues
        );

        $data = new ReportFetchData;
        $data->dimensionCode = 'product';
        $data->metricCodes = ['metric_1'];
        $data->metricsConfiguration = [];
        $data->dateStart = $startDate;
        $data->dateEnd = $endDate;
        $data->startTimestamp = null;
        $data->dimensionFilters = [];
        $data->groupInterval = null;
        $data->orderRule = new ReportDataOrderRule(ReportDataOrderRule::ATTR_TYPE_DIMENSION);
        $data->limit = null;
        $data->paginationParams = null;
        $data->hideEmptyDimensionValues = false;
        $data->reportDataCache = $reportDataCacheMock;
        $data->totalsOnly = false;

        $result = $dataSource->getData($data);

        $this->assertInstanceOf(ReportFetchDataResult::class, $result);
        $rows = $result->getRows();
        $this->assertIsArray($rows);
        $this->assertCount(3, $rows);
        $this->assertEquals($values, $rows);
    }

    private function getDataSource(ReportDimension $dimension, array $rangesAndValues): ReportDataSourceBase
    {
        return new class ($rangesAndValues, $dimension) extends ReportDataSourceBase
        {
            private $rangesAndValues;

            public function __construct($rangesAndValues, $dimension)
            {
                $this->registerDimension($dimension);
                $this->registerMetric(
                    new ReportMetric('metric_1', 'metric_1', 'Metric 1', ReportMetric::AGGREGATE_SUM)
                );
                $this->rangesAndValues = $rangesAndValues;
            }

            protected function fetchData(ReportFetchData $data): ReportFetchDataResult
            {
                foreach ($this->rangesAndValues as $rangeAndValues) {
                    $range = $rangeAndValues['range'];
                    $values = $rangeAndValues['values'];

                    if ($range->getStartDate()->eq($data->dateStart)) {
                        return new ReportFetchDataResult($values);
                    }
                }

                return new ReportFetchDataResult;
            }
        };
    }

    private function mockReportDataCache(): ReportDataCache
    {
        return $this->getMockBuilder(ReportDataCache::class)
            ->disableOriginalConstructor()
            ->getMock();
    }
}