<?php
    $emptyOption = $scope->emptyOption;
    $activeValue = $scope->scopeValue !== null ? $scope->value : $scope->default;
    $flatOptions = $emptyOption ? ['' => __($emptyOption)] + $scope->options() : $scope->options();
    $scopeOptions = $scope->asOptionsDefinition($flatOptions);
?>
<div
    class="filter-scope scope-dropdown"
    data-scope-name="<?= $scope->scopeName ?>">
    <select
        id="<?= $scope->getId() ?>"
        class="select custom-select select-no-search select-dropdown-auto-width"
        style="opacity:0"
    >
        <?php foreach ($scopeOptions as $value => $option): ?>
            <option
                <?= (string) $activeValue === (string) $value ? 'selected="selected"' : '' ?>
                <?php if ($option->color): ?>
                    data-status="<?= e($option->color) ?>"
                <?php elseif ($option->image): ?>
                    data-image="<?= e($option->image) ?>"
                <?php elseif ($option->icon): ?>
                    data-icon="<?= e($option->icon) ?>"
                <?php endif ?>
                value="<?= e($value) ?>"
            ><?= e(__($option->label)) ?></option>
        <?php endforeach ?>
    </select>
</div>
