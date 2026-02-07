<?php namespace Backend\Controllers;

use View;
use Response;
use Redirect;
use BackendMenu;
use Backend\Classes\Controller;

/**
 * Index controller for the dashboard
 *
 * @package october\backend
 * @author Alexey Bobkov, Samuel Georges
 */
class Index extends Controller
{
    /**
     * index controller action
     */
    public function index()
    {
        if ($first = array_first(BackendMenu::listMainMenuItems())) {
            return Redirect::intended($first->url);
        }

        return Response::make(View::make('backend::404'), 404);
    }
}
