<div class="relation-widget" id="<?= $this->getId() ?>">
    <?php if ($this->useController): ?>
        <?= $this->controller->relationRender($this->getRelationControllerFieldName(), [
            'readOnlyDefault' => $this->previewMode
        ] + ($this->readOnly === true ? ['readOnly' => true] : [])) ?>
    <?php else: ?>
        <?= $this->makePartial('~/modules/backend/widgets/form/partials/_field_'.$field->type.'.php', [
            'field' => $field
        ]) ?>
    <?php endif ?>
</div>
