<div id="<?= $this->dashGetId() ?>">
    <input type="hidden" name="_dash_definition" value="<?= $dashDefinition ?>" />

    <?= $dashWidget->render() ?>
</div>
