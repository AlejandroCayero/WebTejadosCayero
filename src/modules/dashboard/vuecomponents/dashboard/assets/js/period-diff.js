Vue.component('dashboard-component-dashboard-report-diff', {
    props: {
        prevValue: Number,
        currentValue: Number,
        formattingOptions: Object,
        store: Object
    },
    methods: {
        formatValue: function (value) {
            return Dashboard_Classes_DataHelper
                .instance()
                .formatValue(
                    value,
                    this.formattingOptions,
                    this.store.state.locale
                );
        }
    },
    computed: {
        diff: function () {
            return this.currentValue - this.prevValue;
        },

        diffFormattedAbs: function () {
            return this.formatValue(Math.abs(this.diff));
        },

        diffFormatted: function () {
            return this.formatValue(this.diff);
        }
    },
    mounted: function mounted() {
    },
    beforeDestroy: function beforeDestroy() {
    },
    watch: {
    },
    template: '#dashboard_vuecomponents_dashboard_period_diff'
});
