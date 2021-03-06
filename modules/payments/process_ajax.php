<?php

/*
* Script: auto_complete_search.php
*     Do the autocomplete of invoice id in the process payment page
*
* License:
*     GPL v3 or above
*/

if (!defined("BROWSE")) define("BROWSE","browse");
//if this page has error with auth remove the above line and figure out how to do it right

$lines = array();
$invoices = Invoice::getInvoices($_GET["q"]);
foreach($invoices as $invoice) {
    $total = htmlsafe(number_format($row['total'],2));
    $paid  = htmlsafe(number_format($row['paid'],2));
    $owing = htmlsafe(number_format($row['owing'],2));
    $lines[] = "$invoice[id]|" .
                  "<table>" .
                    "<tr>" .
                      "<td class='details_screen'>{$invoice['preference']}:</td>" .
                      "<td>{$invoice['index_id']}</td>" .
                      "<td class='details_screen'>Total: </td>" .
                      "<td>{$total}</td>" .
                    "</tr>" .
                    "<tr>" .
                      "<td class='details_screen'>Biller: </td>" .
                      "<td>{$invoice['biller']} </td>" .
                      "<td class='details_screen'>Paid: </td>" .
                      "<td>{$paid}</td>" .
                    "</tr>" .
                    "<tr>" .
                      "<td class='details_screen'>Customer: </td>" .
                      "<td>{$invoice['customer']}</td>" .
                      "<td class='details_screen'>Owing: </td>" .
                      "<td><u>{$owing}</u></td>" .
                    "</tr>" .
                  "</table>\n";
}

foreach($lines as $line) {
    echo $line;
}
