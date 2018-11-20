<?php

use Inc\Claz\Extensions;
use Inc\Claz\SystemDefaults;

global $pdoDb, $smarty;

// Stop direct browsing to this file
checkLogin();

// @formatter:off
$id          = (empty($_GET['id']         ) ? "" : $_GET['id']);
$name        = (empty($_GET['name']       ) ? "" : $_GET['name']);
$action      = (empty($_GET['action']     ) ? "" : $_GET['action']);
$description = (empty($_GET['description']) ? "" : $_GET['description']);
// @formatter:on

$count = 0;
if (!empty($id)) {
    $row = Extensions::get($id);
    if (!empty($row)) {
        $name = $row['name'];
        $description = $row['description'];
    }
    $count = SystemDefaults::extensionCount($id);
}

// @formatter:off
$smarty->assign('id'         , $id);
$smarty->assign('action'     , $action);
$smarty->assign('name'       , $name);
$smarty->assign('count'      , $count);
$smarty->assign('description', $description);
// @formatter:on

$smarty->assign('pageActive', 'extensions');
$smarty->assign('active_tab', '#settings');
