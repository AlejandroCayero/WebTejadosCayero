<?php namespace Tailor\Classes;

use Illuminate\Validation\DatabasePresenceVerifier;

/**
 * PresenceVerifier adds custom logic to exclude drafts and versions
 *
 * @package october\tailor
 * @author Alexey Bobkov, Samuel Georges
 */
class PresenceVerifier extends DatabasePresenceVerifier
{
    /**
     * @var string|null draftModeColumn
     */
    protected $draftModeColumn = null;

    /**
     * @var string|null isVersionColumn
     */
    protected $isVersionColumn = null;

    /**
     * @var string|null deletedAtColumn
     */
    protected $deletedAtColumn = null;

    /**
     * setDraftMode
     */
    public function setDraftMode($column = null)
    {
        $this->draftModeColumn = $column;
    }

    /**
     * setIsVersion
     */
    public function setIsVersion($column = null)
    {
        $this->isVersionColumn = $column;
    }

    /**
     * setDeletedAt
     */
    public function setDeletedAt($column = null)
    {
        $this->deletedAtColumn = $column;
    }

    /**
     * addConditions to the query.
     *
     * @param  \Illuminate\Database\Query\Builder  $query
     * @param  array  $conditions
     * @return \Illuminate\Database\Query\Builder
     */
    protected function addConditions($query, $conditions)
    {
        $query = parent::addConditions($query, $conditions);

        if ($this->draftModeColumn) {
            $query->where($this->draftModeColumn, \Tailor\Classes\Scopes\DraftableScope::MODE_PUBLISHED);
        }

        if ($this->isVersionColumn) {
            $query->where($this->isVersionColumn, false);
        }

        if ($this->deletedAtColumn) {
            $query->whereNull($this->deletedAtColumn);
        }

        return $query;
    }
}
