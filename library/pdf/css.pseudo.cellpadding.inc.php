<?php
// $Header: /cvsroot/html2ps/css.pseudo.cellpadding.inc.php,v 1.6 2006/09/07 18:38:14 Konstantin Exp $

class CSSCellPadding extends CSSPropertyHandler {
  function __construct() {
      parent::__construct(true, false);
  }

  function default_value() { 
    return Value::fromData(1, UNIT_PX);
  }

  function parse($value) { 
    return Value::fromString($value);
  }

  function getPropertyCode() {
    return CSS_HTML2PS_CELLPADDING;
  }

  function getPropertyName() {
    return '-html2ps-cellpadding';
  }
}

$css_pseudo_cellpadding_inc_reg1 = new CSSCellPadding();
CSS::register_css_property($css_pseudo_cellpadding_inc_reg1);
