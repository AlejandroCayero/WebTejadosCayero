'use strict';

/**
 * Dashboard_Classes_InspectorConfigurator
 */
class Dashboard_Classes_InspectorConfigurator
{
    constructor($el, translationFn, store) {
        this.trans = translationFn;
        this.store = store;
        this.$el = $el;

        this.filterAttributeCacheKey = 'ds-filter-attribute';
        this.filterAttributeCachePropertyNames = ['dataSource', 'dimension'];
        this.metricsCacheKey = 'ds-metrics';
        this.metricsCachePropertyNames = ['dataSource', 'dimension'];

        this.dataLoader = oc.Modules.import('backend.component.inspector.dataloader');
    }

    get filterOperations() {
        return {
            '=': oc.lang.get('dashboard.filter_operation_equal_to'),
            '>=': oc.lang.get('dashboard.filter_operation_greater_equal'),
            '<=': oc.lang.get('dashboard.filter_operation_less_equal'),
            '>': oc.lang.get('dashboard.filter_operation_greater'),
            '<': oc.lang.get('dashboard.filter_operation_less'),
            'string_starts_with': oc.lang.get('dashboard.filter_operation_starts_with'),
            'string_includes': oc.lang.get('dashboard.filter_operation_includes'),
            'one_of': oc.lang.get('dashboard.filter_operation_one_of'),
        }
    }

    defineDataSource(configuration, tab, allowedDimensionTypes) {
        const getDynamicOptionsExtraData = () => {
            const result = {};
            if (Array.isArray(allowedDimensionTypes)) {
                result.allowed_dimension_types = allowedDimensionTypes.join(',');
            }

            return result;
        };

        configuration.push({
            property: 'dataSource',
            tab: tab,
            title: oc.lang.get('dashboard.widget_data_source'),
            getDynamicOptionsExtraData: getDynamicOptionsExtraData,
            type: 'dropdown',
            validation: {
                required: {
                    message: oc.lang.get('dashboard.widget_data_source_required'),
                }
            }
        });

        configuration.push({
            property: 'dimension',
            tab: tab,
            title: oc.lang.get('dashboard.widget_dimension'),
            getDynamicOptionsExtraData: getDynamicOptionsExtraData,
            type: 'dropdown',
            depends: ['dataSource'],
            dataCacheKeyName: 'ds-dimensions',
            dataCacheKeyPropertyNames: ['dataSource'],
            validation: {
                required: {
                    message: oc.lang.get('dashboard.widget_dimension_required'),
                }
            }
        });
    }

    propVisible(filter, suppress, propName) {
        const result = !filter.length || filter.includes(propName);
        if (!result) {
            return result;
        }

        return !suppress.includes(propName);
    }

    deletePropertyByName(props, name) {
        const index = props.findIndex(obj => obj.property === name);
        if (index > -1) {
            props.splice(index, 1);
        }
    }

    defineDataSourceProperties(configuration, filter = [], suppress = []) {
        this.propVisible(filter, suppress, 'metrics') && configuration.push({
            property: 'metrics',
            title: oc.lang.get('dashboard.widget_metrics'),
            tab: oc.lang.get('dashboard.tab_general'),
            type: 'objectList',
            titleProperty: 'metric',
            formatItemTitle: async (item, obj, parentObj) => this.formatMetricItemTitle(item, obj, parentObj),
            colorProperty: 'color',
            depends: ['dataSource', 'dimension'],
            itemProperties: [
                {
                    property: 'metric',
                    title: oc.lang.get('dashboard.widget_metric'),
                    type: 'dropdown',
                    dataCacheKeyName: this.metricsCacheKey,
                    dataCacheKeyPropertyNames: this.metricsCachePropertyNames,
                    validation: {
                        required: {
                            message: oc.lang.get('dashboard.widget_metric_required'),
                        }
                    }
                },
                {
                    property: 'color',
                    title: oc.lang.get('dashboard.prop_color'),
                    type: 'dropdown',
                    options: this.store.state.colors,
                    useValuesAsColors: true,
                    validation: {
                        required: {
                            message: oc.lang.get('dashboard.color_required'),
                        }
                    }
                },
                {
                    property: 'displayTotals',
                    title: oc.lang.get('dashboard.prop_display_totals'),
                    type: 'checkbox'
                },
            ],
            validation: {
                required: {
                    message: oc.lang.get('dashboard.widget_metric_required'),
                }
            }
        });

        this.propVisible(filter, suppress, 'limit') && configuration.push({
            tab: oc.lang.get('dashboard.tab_sorting_filtering'),
            property: 'limit',
            title: oc.lang.get('dashboard.limit'),
            placeholder: oc.lang.get('dashboard.limit_placeholder'),
            type: 'string',
            validation: {
                integer: {
                    allowNegative: false,
                    message: oc.lang.get('dashboard.limit_number'),
                    min: {
                        value: 1,
                        message: oc.lang.get('dashboard.limit_min')
                    }
                }
            }
        });

        this.propVisible(filter, suppress, 'empty_dimension_values') && configuration.push({
            tab: oc.lang.get('dashboard.tab_sorting_filtering'),
            property: 'empty_dimension_values',
            group: oc.lang.get('dashboard.empty_values'),
            title: oc.lang.get('dashboard.empty_values_dimension'),
            default: 'not-set',
            type: 'dropdown',
            options: {
                'not-set': oc.lang.get('dashboard.empty_values_display_not_set'),
                'hide': oc.lang.get('dashboard.empty_values_hide')
            }
        });

        this.propVisible(filter, suppress, 'sortBy') && configuration.push({
            tab: oc.lang.get('dashboard.tab_sorting_filtering'),
            property: 'sortBy',
            group: oc.lang.get('dashboard.group_sorting'),
            title: oc.lang.get('dashboard.sort_by'),
            type: 'dropdown',
            default: 'oc_dimension',
            placeholder: oc.lang.get('dashboard.sort_by_placeholder'),
            depends: ['dataSource', 'dimension', 'metrics'],
            dataCacheKeyName: 'ds-sort-by',
            dataCacheKeyPropertyNames: ['dataSource', 'dimension', 'metrics'],
            validation: {
                required: {
                    message: oc.lang.get('dashboard.sort_by_required'),
                }
            }
        });

        this.propVisible(filter, suppress, 'sortOrder') && configuration.push({
            tab: oc.lang.get('dashboard.tab_sorting_filtering'),
            property: 'sortOrder',
            group: oc.lang.get('dashboard.group_sorting'),
            title: oc.lang.get('dashboard.sort_order'),
            type: 'dropdown',
            default: 'asc',
            options: {
                asc: oc.lang.get('dashboard.sort_asc'),
                desc: oc.lang.get('dashboard.sort_desc')
            }
        });

        this.propVisible(filter, suppress, 'date_interval') && configuration.push({
            tab: oc.lang.get('dashboard.tab_sorting_filtering'),
            property: 'date_interval',
            group: oc.lang.get('dashboard.date_interval'),
            title: oc.lang.get('dashboard.prop_date_interval'),
            type: 'dropdown',
            default: 'dashboard',
            options: {
                dashboard: oc.lang.get('dashboard.date_interval_dashboard_default'),
                year: oc.lang.get('dashboard.date_interval_this_year'),
                quarter: oc.lang.get('dashboard.date_interval_this_quarter'),
                month: oc.lang.get('dashboard.date_interval_this_month'),
                week: oc.lang.get('dashboard.date_interval_this_week'),
                hour: oc.lang.get('dashboard.date_interval_past_hour'),
                days: oc.lang.get('dashboard.date_interval_past_days')
            }
        });

        this.propVisible(filter, suppress, 'date_interval') && configuration.push({
            tab: oc.lang.get('dashboard.tab_sorting_filtering'),
            property: 'date_interval_days',
            title: oc.lang.get('dashboard.date_interval_past_days_value'),
            group: oc.lang.get('dashboard.date_interval'),
            placeholder: oc.lang.get('dashboard.date_interval_past_days_placeholder'),
            type: 'string',
            visibility: {
                source_property: 'date_interval',
                value: 'days'
            },
            validation: {
                integer: {
                    allowNegative: false,
                    message: oc.lang.get('dashboard.date_interval_past_days_invalid'),
                    min: {
                        value: 1,
                        message: oc.lang.get('dashboard.date_interval_past_days_invalid')
                    }
                }
            }
        });

        this.propVisible(filter, suppress, 'auto_update') && configuration.push({
            tab: oc.lang.get('dashboard.tab_sorting_filtering'),
            property: 'auto_update',
            title: oc.lang.get('dashboard.auto_update'),
            type: 'checkbox',
        });

        this.propVisible(filter, suppress, 'filters') && configuration.push({
            tab: oc.lang.get('dashboard.tab_sorting_filtering'),
            property: 'filters',
            title: oc.lang.get('dashboard.prop_filters'),
            type: 'objectList',
            titleProperty: 'filter_attribute',
            formatItemTitle: async (item, obj, parentObj) => this.formatFilterItemTitle(item, obj, parentObj),
            depends: ['dataSource', 'dimension'],
            itemProperties: [
                {
                    property: 'filter_attribute',
                    title: oc.lang.get('dashboard.prop_filter_attribute'),
                    type: 'dropdown',
                    dataCacheKeyName: this.filterAttributeCacheKey,
                    dataCacheKeyPropertyNames: this.filterAttributeCachePropertyNames,
                    validation: {
                        required: {
                            message: oc.lang.get('dashboard.filter_select_attribute')
                        }
                    }
                },
                {
                    property: 'operation',
                    title: oc.lang.get('dashboard.prop_operation'),
                    type: 'dropdown',
                    options: this.filterOperations,
                    validation: {
                        required: {
                            message: oc.lang.get('dashboard.filter_select_operation')
                        }
                    }
                },
                {
                    property: 'value_scalar',
                    title: oc.lang.get('dashboard.prop_value'),
                    type: 'string',
                    visibility: {
                        source_property: 'operation',
                        value: 'one_of',
                        inverse: true
                    }
                },
                {
                    property: 'value_array',
                    title: oc.lang.get('dashboard.prop_values'),
                    type: 'text',
                    description: oc.lang.get('dashboard.prop_values_one_per_line'),
                    visibility: {
                        source_property: 'operation',
                        value: 'one_of'
                    }
                }
            ]
        });
    }

    async requestOptions(obj, parentObj, property, cacheKey, cachePropertyNames) {
        var data = Object.assign({}, $.oc.vueUtils.getCleanObject(parentObj), $.oc.vueUtils.getCleanObject(obj));
        data.inspectorProperty = property;

        const responseData = await this.dataLoader.requestOptions(
            this.$el,
            null,
            this.store.getEventHandler('onInspectableGetOptions'),
            data,
            cacheKey,
            cachePropertyNames
        );

        if (!Array.isArray(responseData.options)) {
            throw new Error('onInspectableGetOptions must return an array');
        }

        const result = {};
        responseData.options.forEach(item => {
            result[item.value] = item.title;
        })

        return result;
    }

    async formatFilterItemTitle(item, obj, parentObj) {
        const options = await this.requestOptions(
            obj,
            parentObj,
            'filter_attribute',
            this.filterAttributeCacheKey,
            this.filterAttributeCachePropertyNames
        );

        const attributeName = options[item.filter_attribute];
        let operationName = this.filterOperations[item.operation];
        if (typeof operationName === "string") {
            operationName = operationName.toLowerCase();
        }

        if (item.operation !== 'one_of') {
            return attributeName + ' ' + operationName + ' "' + item.value_scalar + '"';
        }

        const valueArray = item.value_array
            .split('\n')
            .map(item => item.trim())
            .filter((item) => item.length > 0);

        return attributeName + ' ' + operationName + ' ' + '["'+valueArray.join('", "')+'"]';
    }

    async formatMetricItemTitle(item, obj, parentObj) {
        const options = await this.requestOptions(
            obj,
            parentObj,
            'metric',
            this.metricsCacheKey,
            this.metricsCachePropertyNames
        );

        return options[item.metric];
    }
}
