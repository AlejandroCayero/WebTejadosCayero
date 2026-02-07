Vue.component('dashboard-component-dashboard-widget-sectiontitle', {
    extends: Vue.options.components['dashboard-component-dashboard-widget-base'],
    data: function () {
        return {
        }
    },
    computed: {
        title: function () {
            let result = this.widget.configuration.title;

            if (this.widget.configuration.showInterval) {
                result += ': ' + this.store.state.intervalName;
            }

            return result;
        }
    },
    methods: {
        makeDefaultConfigAndData: function () {
            const sizing = Dashboard_Classes_Sizing.instance();

            Vue.set(this.widget.configuration, 'title', 'Section');
            Vue.set(this.widget.configuration, 'showInterval', false);
            Vue.set(this.widget.configuration, 'width', sizing.totalColumns);
        },

        getSettingsConfiguration: function () {
            const result = [{
                property: 'title',
                title: oc.lang.get('dashboard.widget_title'),
                type: 'string',
                validation: {
                    required: {
                        message: oc.lang.get('dashboard.widget_title_required'),
                    }
                }
            }];

            result.push({
                property: 'showInterval',
                title: oc.lang.get('dashboard.section_show_interval'),
                type: 'checkbox'
            });

            return result;
        }
    },
    template: '#dashboard_vuecomponents_dashboard_widget_section_title'
});
