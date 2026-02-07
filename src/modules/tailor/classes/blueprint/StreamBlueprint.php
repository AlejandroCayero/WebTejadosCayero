<?php namespace Tailor\Classes\Blueprint;

/**
 * StreamBlueprint
 *
 * @package october\tailor
 * @author Alexey Bobkov, Samuel Georges
 */
class StreamBlueprint extends EntryBlueprint
{
    /**
     * @var string typeName of the blueprint
     */
    protected $typeName = 'stream';

    /**
     * getModelClassName
     */
    public function getModelClassName()
    {
        return \Tailor\Models\StreamRecord::class;
    }
}
