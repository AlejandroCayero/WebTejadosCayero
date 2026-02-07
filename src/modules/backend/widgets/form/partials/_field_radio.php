<?php
    $fieldOptions = $field->asOptionsDefinition();
    $inlineOptions = $field->inlineOptions;
?>
<!-- Radio List -->
<?php if (count($fieldOptions)): ?>
    <?php if ($inlineOptions): ?><div><?php endif ?>
        <?php foreach ($fieldOptions as $value => $option): ?>
            <?php
                $radioId = 'checkbox_'.$field->getId().'_'.$value;
            ?>
            <div class="form-check <?= $inlineOptions ? 'form-check-inline' : '' ?>">
                <input
                    class="form-check-input"
                    id="<?= $radioId ?>"
                    name="<?= $field->getName() ?>"
                    value="<?= e($value) ?>"
                    type="radio"
                    <?= $field->isSelected($value) ? 'checked' : '' ?>
                    <?= $this->previewMode || $option->disabled ? 'disabled' : '' ?>
                    <?= $field->getAttributes() ?>
                />

                <label class="form-check-label" for="<?= $radioId ?>">
                    <?= $field->getDisplayValue($option->label) ?>
                </label>
                <?php if ($option->comment && strlen($option->comment)): ?>
                    <p class="form-text"><?= $field->getDisplayValue($option->comment) ?></p>
                <?php endif ?>
            </div>
        <?php endforeach ?>
    <?php if ($inlineOptions): ?></div><?php endif ?>
<?php else: ?>

    <!-- No options specified -->
    <?php if ($field->placeholder): ?>
        <p><?= e(__($field->placeholder)) ?></p>
    <?php endif ?>

<?php endif ?>
