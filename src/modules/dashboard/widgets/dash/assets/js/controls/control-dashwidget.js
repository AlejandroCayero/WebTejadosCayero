'use strict';

oc.registerControl('dashwidget', class extends oc.ControlBase
{
    connect() {
        this.universalDateFormat = 'YYYY-MM-DD';
        this.vueElement = this.element.querySelector('[data-vue-template]');
        this.store = this.createStore();

        this.initVue();
        this.initDefaultQueryParameters();

        this.setIntervalRange();
    }

    disconnect() {
        this.store = null;
        if (this.vm) {
            this.vm.$destroy();
        }
    }

    initVue() {
        this.vm = new Vue({
            data: {
                store: this.store
            },
            el: this.vueElement
        });
    }

    createStore() {
        const initialState = this.element.querySelector('[data-vue-state=initial]').innerHTML;
        const store = new Dashboard_Widgets_Dash_Classes_DashStore(this);
        store.setInitialState(JSON.parse(initialState));
        return store;
    }

    initDefaultQueryParameters() {
        const searchParams = new URLSearchParams(window.location.search);

        // Validate and clean parameters
        if (!moment(this.store.getQueryParam('start'), this.universalDateFormat, true).isValid()) {
            searchParams.delete('start');
        }

        if (!moment(this.store.getQueryParam('end'), this.universalDateFormat, true).isValid()) {
            searchParams.delete('end');
        }

        if (!this.store.isIntervalCodeValid(this.store.getQueryParam('interval'))) {
            searchParams.delete('interval');
        }

        if (!this.store.isCompareModeValid(this.store.getQueryParam('compare'))) {
            searchParams.delete('compare');
        }

        // Set defaults
        const requiredQueryParams = {
            start: moment().startOf('month').format(this.universalDateFormat),
            end: moment().format(this.universalDateFormat),
            interval: 'day',
            compare: 'none'
        };

        let isDirty = false;
        for (const [key, defaultValue] of Object.entries(requiredQueryParams)) {
            if (!searchParams.has(key)) {
                searchParams.append(key, defaultValue);
                isDirty = true;
            }
        }

        // Update URL if it has changed
        if (isDirty) {
            this.store.setQueryParams(searchParams);
        }
    }

    setIntervalRange() {
        const dateStart = moment(this.store.getQueryParam('start'), this.universalDateFormat, true);
        const dateEnd = moment(this.store.getQueryParam('end'), this.universalDateFormat, true);

        this.store.state.range.dateStart = dateStart.format(this.universalDateFormat);
        this.store.state.range.dateEnd = dateEnd.format(this.universalDateFormat);
        this.store.state.range.interval = this.store.getQueryParam('interval');
        this.store.state.intervalName = this.makeIntervalName(dateStart.toDate(), dateEnd.toDate());
        this.store.state.compareMode = this.store.getQueryParam('compare');
        this.store.resetData();
    }

    makeIntervalName(startDate, endDate) {
        const startYear = startDate.getFullYear();
        const endYear = endDate.getFullYear();

        let formatterWithoutYear = new Intl.DateTimeFormat(this.store.state.locale, {
            month: 'short',
            day: 'numeric'
        });

        let formatterWithYear = new Intl.DateTimeFormat(this.store.state.locale, {
            year: 'numeric',
            month: 'short',
            day: 'numeric'
        });

        const startFormatted = startYear === endYear
            ? formatterWithoutYear.format(startDate)
            : formatterWithYear.format(startDate);

        const endFormatted = formatterWithYear.format(endDate);

        return startFormatted + ' - ' + endFormatted;
    }
});
