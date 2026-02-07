<?php namespace Backend\Classes\NavigationManager;

use System;
use Tailor\Classes\BlueprintIndexer;

/**
 * HasTailorNavigationContext
 *
 * @package october\backend
 * @author Alexey Bobkov, Samuel Georges
 */
trait HasTailorNavigationContext
{
    /**
     * setTailorContextUuid
     */
    public function setTailorContextUuid(string $uuid, ?string $sideMenuItemCode = null)
    {
        if (!System::hasModule('Tailor')) {
            return;
        }

        $blueprint = BlueprintIndexer::instance()->find($uuid);
        if (!$blueprint) {
            return;
        }

        $this->setContext(
            'October.Tailor',
            $blueprint->getNavigationCodeName(),
            $sideMenuItemCode
        );
    }

    /**
     * setTailorContext
     */
    public function setTailorContext(string $handle, ?string $sideMenuItemCode = null)
    {
        if (!System::hasModule('Tailor')) {
            return;
        }

        $blueprint = BlueprintIndexer::instance()->findByHandle($handle);
        if (!$blueprint) {
            return;
        }

        $this->setContext(
            'October.Tailor',
            $blueprint->getNavigationCodeName(),
            $sideMenuItemCode
        );
    }
}
