Vue.component('dashboard-component-dashboard-interval-selector', {
    props: {
        store: Object
    },
    data: function () {
        return {
            intervalMenuItems: [],
            compareMenuItems: [],
            groupingIntervalName: '',
            compareOptionName: ''
        }
    },
    computed: {
        intervalName: function () {
            return this.store.state.intervalName;
        },

        intervals: function () {
            const result = {};
            const codes = this.store.getValidIntervalCodes();
            codes.forEach((code) => {
                result[code] = oc.lang.get('dashboard.interval_' + code.replace(/-/g, "_"));
            });

            return result;
        },

        compareOptions: function() {
            const result = {};
            const codes = this.store.getValidCompareCodes();
            codes.forEach((code) => {
                result[code] = oc.lang.get('dashboard.compare_' + code.replace(/-/g, "_"));
            });

            return result;
        },

        rangeGroupingInterval: function () {
            return this.store.state.range.interval;
        },

        compareOption: function () {
            return this.store.state.compareMode;
        }
    },
    methods: {
        getStartDateObj: function () {
            return moment(this.store.state.range.dateStart, 'YYYY-MM-DD').toDate();
        },

        setIntervalMenuItems: function () {
            this.intervalMenuItems = [];

            for (let intervalCode in this.intervals) {
                this.intervalMenuItems.push({
                    type: 'radiobutton',
                    command: intervalCode,
                    label: this.intervals[intervalCode],
                    checked: this.store.state.range.interval === intervalCode
                });
            }
        },

        setCompareMenuItems: function () {
            this.compareMenuItems = [];
            for (let optionCode in this.compareOptions) {
                this.compareMenuItems.push({
                    type: 'radiobutton',
                    command: optionCode,
                    label: this.compareOptions[optionCode],
                    checked: this.store.state.compareMode === optionCode
                });
            }
        },

        onSelectIntervalClick: function (ev) {
            this.setIntervalMenuItems();
            this.$refs.intervalMenu.showMenu(ev);
        },

        onSelectCompareClick: function (ev) {
            this.setCompareMenuItems();
            this.$refs.compareMenu.showMenu(ev);
        },

        onIntervalMenuItemCommand: function (command) {
            this.store.setIntervalState({
                interval: command
            });
        },

        getEndDateObj: function () {
            return moment(this.store.state.range.dateEnd, 'YYYY-MM-DD').toDate();
        },

        updateCalendarRange: function () {
            var pickerControl = $(this.$refs.calendarControl).data('daterangepicker');
            pickerControl.setStartDate(this.getStartDateObj());
            pickerControl.setEndDate(this.getEndDateObj());
        },

        onCompareMenuItemCommand: function (command) {
            this.store.setIntervalState({
                compare: command
            });
        },

        onApplyRange: function (ev, picker) {
            this.store.setIntervalState({
                start: picker.startDate.format('YYYY-MM-DD'),
                end: picker.endDate.format('YYYY-MM-DD')
            });
        }
    },
    mounted: function onMounted() {
        new Dashboard_Classes_Calendar(this.$refs.calendarControl, this.store.state.locale);
        $(this.$refs.calendarControl).on('apply.daterangepicker', this.onApplyRange);
        this.updateCalendarRange();
    },
    watch: {
        intervalName: function() {
            this.updateCalendarRange();
        },
        rangeGroupingInterval: {
            immediate: true,
            handler(value) {
                Vue.nextTick(() => {
                    const interval = this.intervals[value];
                    if (interval) {
                        this.groupingIntervalName = interval;
                    }
                })
            }
        },
        compareOption: {
            immediate: true,
            handler(value) {
                Vue.nextTick(() => {
                    const option = this.compareOptions[value];
                    if (option) {
                        this.compareOptionName = option;
                    }
                })
            }
        }
    },
    beforeDestroy: function beforeDestroy() {
    },
    template: '#dashboard_vuecomponents_dashboard_interval_selector'
});
