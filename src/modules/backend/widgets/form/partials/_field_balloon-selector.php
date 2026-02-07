<?php
    $emptyOption = $field->getConfig('allowEmpty');
    $fieldOptions = $field->options();
?>
<!-- Balloon selector -->
<div
    id="<?= $field->getId() ?>"
    class="control-balloon-selector <?= $this->previewMode || $field->disabled ? 'control-disabled' : '' ?>"
    data-control="balloon-selector"
    <?= $emptyOption ? 'data-selector-allow-empty' : '' ?>
    <?= $field->getAttributes() ?>
>
    <ul>
        <?php foreach ($fieldOptions as $value => $text): ?>
            <li data-value="<?= e($value) ?>" class="<?= $field->isSelected($value) ? 'active' : '' ?>"><?= $field->getDisplayValue($text) ?></li>
        <?php endforeach ?>
    </ul>

    <input
        type="hidden"
        name="<?= $field->getName() ?>"
        id="<?= $field->getId() ?>"
        value="<?= e($field->value) ?>"
    />
</div>
