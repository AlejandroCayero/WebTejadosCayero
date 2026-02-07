<?php namespace Tailor\Classes\Scopes;

use Illuminate\Database\Eloquent\Model as ModelBase;
use Illuminate\Database\Eloquent\Builder as BuilderBase;

/**
 * StructureRecordScope
 *
 * @package october\database
 * @author Alexey Bobkov, Samuel Georges
 */
class StructureRecordScope extends EntryRecordScope
{
    /**
     * apply the scope to a given Eloquent query builder.
     */
    public function apply(BuilderBase $builder, ModelBase $model)
    {
        $builder->orderBy('nest_left');
    }
}
