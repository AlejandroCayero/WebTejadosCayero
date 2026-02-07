<?php namespace Tailor\Classes\Scopes;

use Illuminate\Database\Eloquent\Model as ModelBase;
use Illuminate\Database\Eloquent\Builder as BuilderBase;

/**
 * StreamRecordScope
 *
 * @package october\database
 * @author Alexey Bobkov, Samuel Georges
 */
class StreamRecordScope extends EntryRecordScope
{
    /**
     * apply the scope to a given Eloquent query builder.
     */
    public function apply(BuilderBase $builder, ModelBase $model)
    {
        $builder->orderBy('published_at_date', 'desc');
    }
}
