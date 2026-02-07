<?php if (count($dashboards) > 1): ?>
    <?= $this->makePartial('~/modules/dashboard/controllers/index/_dash_sidenav.php') ?>
<?php endif ?>

<div class="pt-4">
    <?= $this->listRender() ?>
</div>
