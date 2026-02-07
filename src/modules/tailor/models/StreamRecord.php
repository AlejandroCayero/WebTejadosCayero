<?php namespace Tailor\Models;

use October\Contracts\Element\ListElement;
use Tailor\Classes\Scopes\StreamRecordScope;

/**
 * StreamRecord model for chronological content
 *
 * @package october\tailor
 * @author Alexey Bobkov, Samuel Georges
 */
class StreamRecord extends EntryRecord
{
    /**
     * afterBoot
     */
    public function afterBoot()
    {
        static::addGlobalScope(new StreamRecordScope);
    }

    /**
     * defineListColumns
     */
    public function defineListColumns(ListElement $host)
    {
        $host->defineColumn('id', 'ID')->invisible();
        $host->defineColumn('title', 'Title')->searchable(true);
        $host->defineColumn('slug', 'Slug')->searchable(true)->invisible();
        $host->defineColumn('entry_type_name', 'Entry Type')->shortLabel('Type')->invisible()->sortable(false);

        $this->getContentFieldsetDefinition()->defineAllListColumns($host, ['except' => $this->fieldModifiers]);

        $host->defineColumn('published_at_date', 'Published Date')->shortLabel('Published')->displayAs('date')->invisible(false)->sortableDefault('desc');
        $host->defineColumn('status_code', 'Status')->shortLabel('')->displayAs('selectable')->sortable(false)->align('right');
        $this->applyCoreColumnModifiers($host);
    }

    /**
     * setPublishingDates
     */
    protected function setPublishingDates($useDate)
    {
        $this->published_at_day = $useDate->format('d');
        $this->published_at_month = $useDate->format('m');
        $this->published_at_year = $useDate->format('Y');
        $this->published_at_date = $useDate;
    }
}
