<?php namespace Backend\Classes;

use Backend\Classes\FilterScope;

/**
 * FilterWidgetBase class contains widgets used specifically for filters
 *
 * @package october\backend
 * @author Alexey Bobkov, Samuel Georges
 */
abstract class FilterWidgetBase extends WidgetBase
{
    /**
     * @var \October\Rain\Database\Model|null model is the related model object for the filter.
     */
    public $model;

    /**
     * @var bool isJsonable determines if the filtered column is stored as JSON in the database.
     */
    public $isJsonable;

    /**
     * @var FilterScope filterScope object containing general filter scope information.
     */
    protected $filterScope;

    /**
     * @var string scopeName contains the raw scope name
     */
    protected $scopeName;

    /**
     * @var string valueFrom contains the attribute value source
     */
    protected $valueFrom;

    /**
     * @var Backend\Widgets\Filter parentFilter that contains this scope
     */
    protected $parentFilter = null;

    /**
     * __construct
     * @param Controller $controller
     * @param FilterScope $filterScope
     * @param array $configuration
     */
    public function __construct($controller, $filterScope, $configuration = [])
    {
        $this->filterScope = $filterScope;
        $this->scopeName = $filterScope->scopeName;
        $this->valueFrom = $filterScope->valueFrom ?: $this->scopeName;
        $this->config = $this->makeConfig($configuration);

        $this->fillFromConfig([
            'model',
            'isJsonable',
            'parentFilter',
        ]);

        parent::__construct($controller, $configuration);
    }

    /**
     * getParentFilter retrieves the parent form for this formwidget
     * @return Backend\Widgets\Filter|null
     */
    public function getParentFilter()
    {
        return $this->parentFilter;
    }

    /**
     * renderForm the form to use for filtering
     */
    public function renderForm()
    {
    }

    /**
     * getScopeName returns the HTML element field name for this widget, used for
     * capturing user input, passed back to the getSaveValue method when saving.
     * @return string
     */
    public function getScopeName()
    {
        return $this->filterScope->getName();
    }

    /**
     * getLoadValue returns the value for this form field,
     * supports nesting via HTML array.
     * @return string
     */
    public function getLoadValue()
    {
        return $this->filterScope->scopeValue;
    }

    /**
     * getHeaderValue looks up the scope header
     */
    public function getHeaderValue()
    {
        return $this->getParentFilter()->getHeaderValue($this->filterScope);
    }

    /**
     * getActiveValue
     */
    public function getActiveValue()
    {
        if (post('clearScope')) {
            return null;
        }

        return post($this->getScopeName(), post("Filter"));
    }

    /**
     * getFilterScope
     */
    public function getFilterScope()
    {
        return $this->filterScope;
    }

    /**
     * applyScopeToQuery
     */
    public function applyScopeToQuery($query)
    {
    }

    /**
     * hasPostValue
     */
    protected function hasPostValue($name): bool
    {
        $value = post(
            $this->getScopeName() . "[{$name}]",
            post("Filter[{$name}]")
        );

        return strlen(trim((string) $value)) > 0;
    }
}
