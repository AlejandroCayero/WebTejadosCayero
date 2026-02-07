Vue.component('dashboard-component-dashboard-report', {
    props: {
        rows: Array,
        store: Object
    },
    methods: {
        onAddRowClick: function () {
            const uniqueKey = Dashboard_Classes_Helpers
                .instance()
                .makeUniqueKey(this.rows);

            this.rows.push({
                _unique_key: uniqueKey,
                widgets: []
            });
        },

        onDeleteRow: function (index) {
            this.rows.splice(index, 1);
        }
    },
    data: function () {
        return {
            rowCounter: 0,
            activeResponsivePoints: [],
            responsivePoints: null,
            resizeObserver: null
        }
    },
    computed: {
        cssClass: function () {
            const result = [];

            if (this.store.state.editMode) {
                result.push('edit-mode');
            }
            else {
                this.activeResponsivePoints.forEach((value) => {
                    result.push('responsive-point-' + value);
                });
            }

            return result;
        }
    },
    mounted: function mounted() {
        Dashboard_Classes_Dragging
            .instance()
            .setStore(this.store);

        this.responsivePoints = {
            1200: 1,
            992: 2,
            768: 3,
            576: 4
        };

        this.resizeObserver = new ResizeObserver(entries => {
            for (let entry of entries) {
                const { width } = entry.contentRect;
                this.activeResponsivePoints.splice(0);
                Object.keys(this.responsivePoints).forEach((pointWidth) => {
                    if (pointWidth >= width) {
                        this.activeResponsivePoints.push(this.responsivePoints[pointWidth]);
                    }
                });
            }
        });

        this.resizeObserver.observe(this.$el);
    },
    beforeDestroy: function beforeDestroy() {
        if (this.resizeObserver) {
            this.resizeObserver.disconnect();
        }

        this.resizeObserver = null;
        this.responsivePoints = null;
    },
    watch: {},
    template: '#dashboard_vuecomponents_dashboard_report'
});
