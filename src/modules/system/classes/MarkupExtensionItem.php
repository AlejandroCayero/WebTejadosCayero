<?php namespace System\Classes;

use Str;
use ApplicationException;

/**
 * MarkupExtensionItem class
 *
 * @package october\system
 * @author Alexey Bobkov, Samuel Georges
 */
class MarkupExtensionItem
{
    /**
     * {{ 'a'|filter }}
     */
    const TYPE_FILTER = 'filter';

    /**
     * {{ function() }}
     */
    const TYPE_FUNCTION = 'function';

    /**
     * {% token %}
     */
    const TYPE_TOKEN_PARSER = 'token';

    /**
     * @var string name
     */
    public $name;

    /**
     * @var string type
     */
    public $type;

    /**
     * @var callable callback
     */
    public $callback;

    /**
     * @var array options
     */
    public $options = [];

    /**
     * @var bool escapeOutput
     */
    public $escapeOutput = true;

    /**
     * useConfig
     */
    public function useConfig(array $data): MarkupExtensionItem
    {
        [$callback, $options] = $this->parseDefinition($data['definition'] ?? null);

        $this->name = $data['name'] ?? $this->name;
        $this->type = $data['type'] ?? $this->type;
        $this->callback = $data['callback'] ?? $callback;
        $this->options = $data['options'] ?? $this->options;
        $this->escapeOutput = $data['escapeOutput'] ?? $this->escapeOutput;

        if (is_array($options)) {
            $this->options = $options;
        }
        elseif (is_bool($options)) {
            $this->escapeOutput = $options;
        }

        return $this;
    }

    /**
     * parseDefinition will check if a callable definition contains output escaping
     */
    protected function parseDefinition($definition): array
    {
        $options = [];
        $callback = $definition;

        // If the last item in the array is a boolean, it defines output escaping
        // otherwise if it is an array, it defines the Twig extension options
        if ($this->isOptionOrEscapedCheck($callback)) {
            $options = array_pop($callback);
        }

        // Convert an array with 1 item to a scalar, to make it callable
        // for example, ['count'] is not callable
        if (is_array($callback) && count($callback) === 1) {
            $callback = array_pop($callback);
        }

        return [$callback, $options];
    }

    /**
     * isWildCallable will test if the callback uses a wildcard,
     * for example, str_* can route to Str::*
     */
    public function isWildCallable(): bool
    {
        $callable = $this->callback;
        $isWild = false;

        if (is_string($callable) && strpos($callable, '*') !== false) {
            $isWild = true;
        }

        if (is_array($callable)) {
            if (is_string($callable[0]) && strpos($callable[0], '*') !== false) {
                $isWild = true;
            }

            if (!empty($callable[1]) && strpos($callable[1], '*') !== false) {
                $isWild = true;
            }
        }

        return $isWild;
    }

    /**
     * getWildCallback replaces wildcard with a real callable function
     */
    public function getWildCallback(string $name)
    {
        $callable = $this->callback;
        $wildCallback = null;

        if (is_string($callable) && strpos($callable, '*') !== false) {
            $wildCallback = str_replace('*', $name, $callable);
        }

        if (is_array($callable)) {
            if (is_string($callable[0]) && strpos($callable[0], '*') !== false) {
                $wildCallback = $callable;
                $wildCallback[0] = str_replace('*', $name, $callable[0]);
            }

            if (!empty($callable[1]) && strpos($callable[1], '*') !== false) {
                $wildCallback = $wildCallback ?: $callable;
                $wildCallback[1] = str_replace('*', $name, $callable[1]);
            }
        }

        return $wildCallback;
    }

    /**
     * getTwigCallback returns a callback function suitable for Twig
     */
    public function getTwigCallback()
    {
        // Handle a wildcard function
        if (strpos($this->name, '*') !== false && $this->isWildCallable()) {
            return function ($name) {
                $arguments = array_slice(func_get_args(), 1);
                $method = $this->getWildCallback(Str::camel($name));
                return $method(...$arguments);
            };
        }

        // Cannot call item method
        $callable = $this->callback;
        if (!is_callable($callable)) {
            throw new ApplicationException("The markup filter/function for '{$this->name}' is not callable.");
        }

        // Wrap in a closure to prevent Twig from reflecting facades
        // when applying its named closure support
        return function(...$args) use ($callable) {
            return $callable(...$args);
        };
    }

    /**
     * getTwigOptions returns options passed to the Twig definition
     */
    public function getTwigOptions(): array
    {
        return ($this->escapeOutput ? [] : ['is_safe' => ['html']]) + $this->options;
    }

    /**
     * isOptionOrEscapedCheck determines if the last value of the definition
     */
    protected function isOptionOrEscapedCheck($callback): bool
    {
        if (!is_array($callback) || count($callback) < 2) {
            return false;
        }

        // Grab the last value found in the array
        $value = $callback[array_key_last($callback)];

        return is_bool($value) || is_array($value);
    }
}
