<div class="dashboard-selector">
    <h2 v-text="currentDashboard.name"></h2>
    <div v-if="canCreateAndEdit" class="dashboard-button-set">
        <button
            v-if="embeddedInDashboard"
            class="dashboard-toolbar-button"
            @click.stop.prevent="onEditClick"
            aria-label="<?= __("Edit Dashboard") ?>"
            title="<?= __("Edit Dashboard") ?>"
        ><i class="ph ph-gear"></i></button>
        <backend-component-dropdownmenu
            :items="editMenuItems"
            ref="editMenu"
            @command="onEditMenuItemCommand"
        ></backend-component-dropdownmenu>
    </div>
</div>
