<?php namespace Backend\Facades;

use October\Rain\Support\Facade;

/**
 * BackendMenu
 *
 * @method static void setContext(string $owner, string $mainMenuItemCode, string $sideMenuItemCode = null)
 * @method static void setContextOwner(string $owner)
 * @method static void setContextMainMenu(string $mainMenuItemCode)
 * @method static void setContextSideMenu(string $sideMenuItemCode)
 * @method static void setTailorContext(string $handle, string $sideMenuItemCode = null)
 * @method static void setTailorContextUuid(string $uuid, string $sideMenuItemCode = null)
 * @method static bool isMainMenuItemActive(\Backend\Classes\MainMenuItem $item)
 * @method static bool isSideMenuItemActive(\Backend\Classes\SideMenuItem $item)
 * @method static bool isDashboardItemActive()
 * @method static object getContext()
 *
 * @see \Backend\Classes\NavigationManager
 */
class BackendMenu extends Facade
{
    /**
     * getFacadeAccessor returns the registered name of the component
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return 'backend.menu';
    }
}
