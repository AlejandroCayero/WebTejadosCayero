Vue.component('dashboard-component-dashboard-widget-textnotice', {
    extends: Vue.options.components['dashboard-component-dashboard-widget-base'],
    data: function () {
        return {
        }
    },
    computed: {
    },
    methods: {
        makeDefaultConfigAndData: function () {
            Vue.set(this.widget.configuration, 'title', 'Text Notice');
            Vue.set(this.widget.configuration, 'notice', 'This is a text notice widget.');
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
                property: 'notice',
                title: oc.lang.get('dashboard.notice_text'),
                type: 'text',
            });

            return result;
        }
    },
    template: '#dashboard_vuecomponents_dashboard_widget_text_notice'
});
