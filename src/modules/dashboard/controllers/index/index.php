<?php if (count($dashboards) > 1): ?>
    <?= $this->makePartial('dash_sidenav') ?>
<?php endif ?>

<?php if ($dashboard): ?>
    <form>
        <div class="padded-container">
            <?= $this->dashRender($dashboard->code) ?>
        </div>
    </form>
<?php else: ?>
    <div class="padded-container">
        <p class="flash-message static error">
            <?= __("The requested dashboard could not be found.") ?>
        </p>
        <p>
            <a href="<?= Backend::url('backend') ?>" class="btn btn-default">
                <?= __("Return to Dashboard") ?>
            </a>
        </p>
    </div>
<?php endif ?>
