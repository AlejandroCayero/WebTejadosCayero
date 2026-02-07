<?php
    $flatOptions = $field->options();
    $fieldOptions = $field->asOptionsDefinition($flatOptions);
    $isScrollable = count($flatOptions) > 10;
    $checkedValues = (array) $field->value;
    $inlineOptions = $field->inlineOptions && !$isScrollable;
    $isQuickSelect = $field->getConfig('quickselect', $isScrollable);
?>

<?php $renderCheckboxListCheckboxFunc = function($option, $value) use (&$renderCheckboxListCheckboxFunc, $field, $inlineOptions, $checkedValues) { ?>
    <?php
        $checkboxId = 'checkbox_'.$field->getId().'_'.$value;
    ?>
    <?php if (!$this->previewMode || in_array($value, $checkedValues)): ?>
        <div class="form-check <?= $inlineOptions ? 'form-check-inline' : '' ?>">
            <input
                class="form-check-input"
                type="checkbox"
                id="<?= $checkboxId ?>"
                name="<?= $field->getName() ?>[]"
                value="<?= e($value) ?>"
                <?php if ($this->previewMode): ?>
                    disabled
                    checked
                <?php else: ?>
                    <?= in_array($value, $checkedValues) ? 'checked="checked"' : '' ?>
                    <?= $field->disabled || $option->disabled ? 'disabled' : '' ?>
                    <?= $field->readOnly || $option->readOnly ? 'onclick="return false"' : '' ?>
                <?php endif ?>
            />
            <label class="form-check-label" for="<?= $checkboxId ?>">
                <?= $field->getDisplayValue($option->label) ?>
            </label>
            <?php if ($option->comment && strlen($option->comment)): ?>
                <p class="form-text"><?= $field->getDisplayValue($option->comment) ?></p>
            <?php endif ?>
        </div>
    <?php endif ?>

    <?php if ($option->children): ?>
        <ul class="checkboxlist-group">
            <?php foreach ($option->children as $value => $option): ?>
                <li class="checkboxlist-group-item">
                    <?php $renderCheckboxListCheckboxFunc($option, $value) ?>
                </li>
            <?php endforeach ?>
        </ul>
    <?php endif ?>
<?php }; ?>

<!-- Checkbox List -->
<?php if ($this->previewMode): ?>

    <?php if ($field->value): ?>
        <div class="field-checkboxlist control-disabled">
            <?php foreach ($fieldOptions as $value => $option): ?>
                <?php $renderCheckboxListCheckboxFunc($option, $value) ?>
            <?php endforeach ?>
        </div>
    <?php else: ?>
        <!-- No options specified -->
        <?php if ($field->placeholder): ?>
            <p><?= e(__($field->placeholder)) ?></p>
        <?php endif ?>
    <?php endif ?>

<?php else: ?>
    <div class="field-checkboxlist <?= $field->cumulative ? 'is-cumulative' : '' ?> <?= $isScrollable ? 'is-scrollable' : '' ?> <?= $field->disabled ? 'control-disabled' : '' ?>" <?= $field->getAttributes() ?>>
        <?php if ($isQuickSelect): ?>
            <!-- Quick selection -->
            <div class="checkboxlist-controls">
                <a
                    href="javascript:;" class="backend-toolbar-button control-button"
                    <?= $field->disabled ? 'disabled' : '' ?>
                    <?= $field->readOnly ? 'readonly' : '' ?>
                    data-field-checkboxlist-all>
                    <i class="icon-check-multi"></i>
                    <span class="button-label"><?= e(trans('backend::lang.form.select_all')) ?></span>
                </a>

                <a
                    href="javascript:;" class="backend-toolbar-button control-button"
                    <?= $field->disabled ? 'disabled' : '' ?>
                    <?= $field->readOnly ? 'readonly' : '' ?>
                    data-field-checkboxlist-none>
                    <i class="icon-eraser"></i>
                    <span class="button-label"><?= e(trans('backend::lang.form.select_none')) ?></span>
                </a>
            </div>
        <?php endif ?>

        <div class="field-checkboxlist-inner">
            <?php if ($isScrollable): ?>
                <!-- Scrollable Checkbox list -->
                <div class="field-checkboxlist-scrollable">
                    <div class="control-scrollbar" data-control="scrollbar">
            <?php endif ?>

            <input
                type="hidden"
                name="<?= $field->getName() ?>"
                value=""
                <?= $field->disabled ? 'disabled' : '' ?>
            />

            <?php if (count($fieldOptions)): ?>
                <?php foreach ($fieldOptions as $value => $option): ?>
                    <?php $renderCheckboxListCheckboxFunc($option, $value) ?>
                <?php endforeach ?>
            <?php else: ?>
                <p class="text-muted"><?= e(__($field->emptyOption)) ?></p>
            <?php endif ?>

            <?php if ($isScrollable): ?>
                    </div>
                </div>
            <?php endif ?>

        </div>
    </div>

<?php endif ?>
