{*
/*
* Script: total.tpl
* 	 Total style invoice template
*
* License:
*	 GPL v3 or above
*
* Website:
*	https://simpleinvoices.group
*/
*}

<form name="frmpost" action="index.php?module=invoices&amp;view=save" method="POST">
    <div class="si_invoice_form">
        {include file="$path/header.tpl" }
        <table id="itemtable" class="si_invoice_items">
            <tr>
                <th class="left">{$LANG.description}</th>
            </tr>
            <tr>
                <td class="si_invoice_notes">
                    <textarea class="editor" name="description" rows="10" cols="100%">{if isset($defaultInvoice.note)}{$defaultInvoice.note}{/if}</textarea>
                </td>
            </tr>
        </table>

        <table class="si_invoice_bot">
            <tr class="si_invoice_total">
                <th class="">{$LANG.gross_total}</th>
                {section name=tax_header loop=$defaults.tax_per_line_item }
                    <th class="">{$LANG.tax} {if $defaults.tax_per_line_item > 1}{$smarty.section.tax_header.index+1|htmlsafe}{/if} </th>
                {/section}
            </tr>

            <tr class="si_invoice_total">
                <td><input type="text" class="si_right validate[required]" name="unit_price" id="unit_price0" size="15"
                    value="{if isset($defaultInvoiceItems[0].unit_price)}{$defaultInvoiceItems[0].unit_price|siLocal_number}{/if}"/></td>
                {if !isset($taxes) }
                    <td><p><em>{$LANG.no_taxes}</em></p></td>
                {else}
                    {section name=tax start=0 loop=$defaults.tax_per_line_item step=1}
                        {assign var="taxNumber" value=$smarty.section.tax.index }
                        <td>
                            <select id="tax_id[{$smarty.section.line.index|htmlsafe}][{$smarty.section.tax.index|htmlsafe}]"
                                    name="tax_id[{$smarty.section.line.index|htmlsafe}][{$smarty.section.tax.index|htmlsafe}]">
                                <option value=""></option>
                                {foreach from=$taxes item=tax}
                                    <option value="{if isset($tax.tax_id)}{$tax.tax_id|htmlsafe}{/if}"
                                            {if $tax.tax_id == $defaultInvoiceItems[0].tax[$taxNumber]}selected{/if}>{$tax.tax_description|htmlsafe}</option>
                                {/foreach}
                            </select>
                        </td>
                    {/section}
                {/if}
            </tr>
        </table>
        <table class="si_invoice_bot">
            <tr class=""si_invoice_total">
                <th class="">{$LANG.inv_pref}</th>
                <td>
                    {if !isset($preferences) }
                        <p><em>{$LANG.no_preferences}</em></p>
                    {else}
                        <select name="preference_id">
                            {foreach from=$preferences item=preference}
                                <option {if $preference.pref_id == $defaults.preference} selected {/if} value="{if isset($preference.pref_id)}{$preference.pref_id|htmlsafe}{/if}">
                                    {$preference.pref_description|htmlsafe}
                                </option>
                            {/foreach}
                        </select>
                    {/if}
                </td>
                <th>{$LANG.sales_representative}</th>
                <td>
                    <input id="sales_representative}" name="sales_representative" size="30"
                           value="{if  isset($defaultInvoice.sales_representative)}{$defaultInvoice.sales_representative|htmlsafe}{/if}" />
                </td>
            </tr>

            {$customFields.1}
            {$customFields.2}
            {$customFields.3}
            {$customFields.4}
        </table>
        <br/>
        <div class="si_toolbar si_toolbar_form">
            <button type="submit" class="positive" name="submit" value="{$LANG.save}">
                <img class="button_img" src="images/common/tick.png" alt=""/>
                {$LANG.save}
            </button>
            <a href="index.php?module=invoices&amp;view=manage" class="negative">
                <img src="images/common/cross.png" alt=""/>
                {$LANG.cancel}
            </a>
        </div>

        <div class="si_help_div">
            <a class="cluetip" href="#" title="{$LANG.want_more_fields}"
               rel="index.php?module=documentation&amp;view=view&amp;page=help_invoice_custom_fields">
                <img src="{$help_image_path}help-small.png" alt=""/>
                {$LANG.want_more_fields}
            </a>
        </div>
    </div>
    <input type="hidden" name="max_items" value="{if isset($smarty.section.line.index)}{$smarty.section.line.index|htmlsafe}{/if}"/>
    <input type="hidden" name="type" value="1"/>
</form>
