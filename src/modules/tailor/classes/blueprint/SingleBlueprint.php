<?php namespace Tailor\Classes\Blueprint;

/**
 * SingleBlueprint
 *
 * @package october\tailor
 * @author Alexey Bobkov, Samuel Georges
 */
class SingleBlueprint extends EntryBlueprint
{
    /**
     * @var string typeName of the blueprint
     */
    protected $typeName = 'single';

    /**
     * getModelClassName
     */
    public function getModelClassName()
    {
        return \Tailor\Models\SingleRecord::class;
    }

    /**
     * usePageFinder in a specific context, either item or list.
     */
    public function usePageFinder(string $context = 'item')
    {
        if ($context === 'list') {
            return false;
        }

        return parent::usePageFinder($context);
    }
}
