<?php namespace Tailor\Classes\Blueprint;

use System;
use Cms\Classes\ThemeManager;
use System\Classes\PluginManager;
use Exception;

/**
 * HasDatasources
 *
 * @package october\tailor
 * @author Alexey Bobkov, Samuel Georges
 */
trait HasDatasources
{
    /**
     * @var string datasource is the data source for the model, a directory path.
     */
    protected $datasource;

    /**
     * @var string datasourceTheme is the theme directory name, used to filter blueprints.
     */
    protected $datasourceTheme;

    /**
     * @var array|null resolvedPlugins
     */
    protected static $resolvedPlugins = null;

    /**
     * @var array|null resolvedThemes
     */
    protected static $resolvedThemes = null;

    /**
     * inDatasource prepares the datasource for the model.
     */
    public static function inDatasource($path, $theme = null)
    {
        $obj = new static;

        $obj->datasource = $path;

        if ($theme) {
            $obj->datasourceTheme = $theme;
        }

        return $obj;
    }

    /**
     * getDatasourceTheme
     */
    public function getDatasourceTheme()
    {
        return $this->datasourceTheme;
    }

    /**
     * getDefaultPlugins
     */
    protected static function getDefaultPlugins()
    {
        if (self::$resolvedPlugins !== null) {
            return self::$resolvedPlugins;
        }

        $result = [];

        try {
            $plugins = PluginManager::instance()->getPluginPaths();
            foreach ($plugins as $code => $path) {
                if (file_exists($bpPath = $path . '/blueprints')) {
                    $result[$code] = $bpPath;
                }
            }
        }
        catch (Exception $ex) {
        }

        return self::$resolvedPlugins = $result;
    }

    /**
     * getDefaultThemes
     */
    protected static function getDefaultThemes()
    {
        if (self::$resolvedThemes !== null) {
            return self::$resolvedThemes;
        }

        $result = [];

        try {
            $themes = System::hasModule('Cms') ? ThemeManager::instance()->getThemePaths() : [];
            foreach ($themes as $code => $path) {
                if (file_exists($bpPath = $path . '/blueprints')) {
                    $result[$code] = $bpPath;
                }
            }
        }
        catch (Exception $ex) {
        }

        return self::$resolvedThemes = $result;
    }
}
