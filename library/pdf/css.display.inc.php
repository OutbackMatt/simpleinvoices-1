<?php
// $Header: /cvsroot/html2ps/css.display.inc.php,v 1.21 2006/09/07 18:38:13 Konstantin Exp $

class CSSDisplay extends CSSPropertyHandler {
  function __construct() {
      parent::__construct(false, false);
  }

  function get_parent() { 
    if (isset($this->_stack[1])) {
      return $this->_stack[1][0]; 
    } else {
      return 'block';
    };
  }

  function default_value() { return "inline"; }

  function getPropertyCode() {
    return CSS_DISPLAY;
  }

  function getPropertyName() {
    return 'display';
  }

  function parse($value) { 
    return trim(strtolower($value));
  }
}

$css_display_inc_reg1 = new CSSDisplay();
CSS::register_css_property($css_display_inc_reg1);

function is_inline_element($display) {
  return 
    $display == "inline" ||
    $display == "inline-table" ||
    $display == "compact" ||
    $display == "run-in" || 
    $display == "-button" ||
    $display == "-checkbox" ||
    $display == "-iframe" ||
    $display == "-image" ||
    $display == "inline-block" ||
    $display == "-radio" ||
    $display == "-select";
}
