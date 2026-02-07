<div
    class="dashboard-report-widget-notice"
    :class="{'loading': loading}"
>
    <div class="widget-body">
        <h3 v-text="widget.configuration.title"></h3>
        <p v-if="widget.configuration.notice" v-text="widget.configuration.notice"></p>
    </div>
</div>
