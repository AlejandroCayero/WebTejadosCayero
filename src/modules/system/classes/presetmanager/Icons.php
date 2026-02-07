<?php namespace System\Classes\PresetManager;

/**
 * Icons is a resource file with minimal dependencies
 *
 * @package october\system
 * @author Alexey Bobkov, Samuel Georges
 */
class Icons
{
    /**
     * icons collection
     */
    public static function icons(): array
    {
        $icons = json_decode(file_get_contents(__DIR__.'/icons.json'), true);

        $result = [];
        foreach ((array) $icons as $icon) {
            $result["oc-icon-{$icon}"] = [$icon, "oc-icon-{$icon}"];
        }

        // Sort icons alphabetically
        asort($result);

        return $result;
    }

    /**
     * iconsPhosphor
     */
    public static function iconsPhosphor(): array
    {
        $icons = json_decode(file_get_contents(__DIR__.'/icons-phosphor.json'), true);

        $result = [];
        foreach ((array) $icons as $icon) {
            $result["ph ph-{$icon}"] = [$icon, "ph ph-{$icon}"];
        }

        // Sort icons alphabetically
        asort($result);

        return $result;
    }

    /**
     * bootstrapIcons
     */
    public static function bootstrapIcons(): array
    {
        $icons = json_decode(file_get_contents(__DIR__.'/icons-bootstrap.json'), true);

        $result = [];
        foreach ((array) $icons as $icon) {
            $result["bi-{$icon}"] = [$icon, "bi bi-{$icon}"];
        }

        // Sort icons alphabetically
        asort($result);

        return $result;
    }
}
