<?php namespace Tailor\Models;

use Site;
use October\Contracts\Element\ListElement;
use October\Contracts\Element\FormElement;
use Tailor\Classes\Scopes\StructureRecordScope;

/**
 * StructureRecord model for structured content
 *
 * @package october\tailor
 * @author Alexey Bobkov, Samuel Georges
 */
class StructureRecord extends EntryRecord
{
    use \Tailor\Traits\NestedTreeModel;

    /**
     * afterBoot
     */
    public function afterBoot()
    {
        static::addGlobalScope(new StructureRecordScope);
    }

    /**
     * defineListColumns
     */
    public function defineListColumns(ListElement $host)
    {
        $host->defineColumn('id', 'ID')->invisible();
        $host->defineColumn('title', 'Title')->searchable(true);
        $host->defineColumn('slug', 'Slug')->searchable(true)->invisible();
        $host->defineColumn('fullslug', 'Full Slug')->searchable(false)->invisible();
        $host->defineColumn('entry_type_name', 'Entry Type')->shortLabel('Type')->invisible()->sortable(false);

        $this->getContentFieldsetDefinition()->defineAllListColumns($host, ['except' => $this->fieldModifiers]);

        $host->defineColumn('published_at_date', 'Published Date')->shortLabel('Published')->displayAs('date')->invisible(true)->sortableDefault(false);
        $host->defineColumn('status_code', 'Status')->shortLabel('')->displayAs('selectable')->sortable(false)->align('right');
        $this->applyCoreColumnModifiers($host);
    }

    /**
     * defineSecondaryFormFields
     */
    public function defineSecondaryFormFields(FormElement $host)
    {
        $host->addFormField('slug', 'Slug')->preset(['field' => 'title', 'type' => 'slug']);
        $host->addFormField('is_enabled', 'Enabled')->displayAs('switch')->defaults(true);
        $host->addFormField('published_at', 'Publish Date')->displayAs('datepicker')->defaultTimeMidnight();
        $host->addFormField('expired_at', 'Expiry Date')->displayAs('datepicker')->defaultTimeMidnight();
        $host->addFormField('parent_id', 'Parent')->displayAs('dropdown');
        $this->applyCoreFieldModifiers($host);
    }

    /**
     * useNestedTreeStructure only for primary records
     */
    public function useNestedTreeStructure(): bool
    {
        return !$this->primary_id;
    }

    /**
     * newNestedTreeQuery creates a new query for nested sets
     */
    protected function newNestedTreeQuery()
    {
        $query = $this->newQuery()->withSavedDrafts();

        // Nested tree query must have context
        if (Site::hasGlobalContext() && $this->isMultisiteEnabled()) {
            $query->withSite($this->site_id ?: Site::getSiteIdFromContext());
        }

        return $query;
    }
}
