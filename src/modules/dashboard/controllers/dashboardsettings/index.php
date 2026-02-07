<?php if (!$this->fatalError): ?>

<?= Form::open(['class'=>'d-flex flex-column h-100 design-settings']) ?>
    <div>
        <div class="scoreboard">
            <div data-control="toolbar">
                <div class="scoreboard-item title-value">
                    <h4>Traffic Records</h4>
                    <p><?= e($recordsTotal) ?></p>
                    <p class="description">
                        <a
                            href="javascript:;"
                            data-request="onPurgeData"
                            data-request-message="<?= e(trans('dashboard::lang.internal_traffic_statistics.purging')) ?>"
                            data-request-confirm="<?= e(trans('dashboard::lang.internal_traffic_statistics.purge_data_confirm')) ?>"
                        ><?= e(trans('dashboard::lang.internal_traffic_statistics.purge_button')) ?></a>
                    </p>
                </div>
                <div class="scoreboard-item title-value">
                    <h4>Sample Traffic Data</h4>
                    <p>Seed</p>
                    <p class="description">
                        <a
                            href="javascript:;"
                            data-request="onGenerateDemoData"
                            data-request-message="Generating data..."
                            data-request-confirm="Do you really want to generate the demo traffic data? This could take a few minutes..."
                        ><?= __("Generate Data") ?></a>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="flex-grow-1">
        <?= $this->formRender() ?>
    </div>

    <div class="form-buttons">
        <div data-control="loader-container">
            <?= Ui::ajaxButton("Save", 'onSave')
                ->primary()
                ->ajaxData(['redirect' => false])
                ->hotkey('ctrl+s', 'cmd+s')
                ->loadingMessage(__("Saving...")) ?>

            <?= Ui::ajaxButton(__("Save & Close"), 'onSave')
                ->secondary()
                ->ajaxData(['close' => true])
                ->hotkey('ctrl+enter', 'cmd+enter')
                ->loadingMessage(__("Saving...")) ?>

            <span class="btn-text">
                <span class="button-separator"><?= __("or") ?></span>
                <?= Ui::button("Cancel", 'system/settings')
                    ->textLink() ?>
            </span>

            <span class="pull-right btn-text">
                <?= Ui::ajaxButton("Reset to Default", 'onResetDefault')
                    ->textLink()
                    ->ajaxData(['redirect' => false])
                    ->confirmMessage(__("Are you sure?"))
                    ->loadingMessage(__("Resetting...")) ?>
            </span>
        </div>
    </div>

<?= Form::close() ?>

<?php else: ?>
    <p class="flash-message static error"><?= e(__($this->fatalError)) ?></p>
    <p><a href="<?= Backend::url('system/settings') ?>" class="btn btn-default"><?= __('Return to System Settings') ?></a></p>
<?php endif ?>
