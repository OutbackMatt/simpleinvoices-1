{*
 * Script: header.tpl
 *   Header file for invoice template
 *
 * License:
 *   GPL v3 or above
 *
 * Website:
 *   https://simpleinvoices.group
 *}
  <input type="hidden" name="action" value="insert" />
  <div class="si_filters si_buttons_invoice_header">
    <span class="si_filters_links">
      <a href="index.php?module=invoices&amp;view=itemised"
         class="first{if $view=='itemised'} selected{/if}">
          <img class="action" src="images/common/edit.png"/>
          {$LANG.itemised_style}
      </a>
      <a href="index.php?module=invoices&amp;view=total"
         class="{if $view=='total'}selected{/if}">
          <img class="action" src="images/common/page_white_edit.png"/>
          {$LANG.total_style}
      </a>
    </span>
    <span class="si_filters_title">
      <a class="cluetip" href="#" title="{$LANG.invoice_type}"
         rel="index.php?module=documentation&amp;view=view&amp;page=help_invoice_types">
          <img class="" src="{$help_image_path}help-small.png" alt="" />
      </a>
    </span>
  </div>
  <table class="center">
    <tr>
      <td>
        <table class="left">
          <tr>
            <td class="details_screen">{$LANG.biller}</td>
            <td>
              {if $billers == null }
                <p><em>{$LANG.no_billers}</em></p>
              {else}
                <select name="biller_id">
                  {foreach from=$billers item=biller}
                    <option {if $biller.id == $defaults.biller} selected {/if} value="{if isset($biller.id)}{$biller.id|htmlsafe}{/if}">
                      {$biller.name|htmlsafe}
                    </option>
                  {/foreach}
                </select>
              {/if}
            </td>
          </tr>
          <tr>
            <td class="details_screen">{$LANG.customer}</td>
            <td>
              {if $customers == null }
                <em>{$LANG.no_customers}</em>
              {else}
                <select name="customer_id" id="customer_id">
                  {foreach from=$customers item=customer}
                    <option {if $customer.id == $defaults.customer} selected{/if} value="{if isset($customer.id)}{$customer.id|htmlsafe}{/if}">
                      {$customer.name|htmlsafe}
                    </option>
                  {/foreach}
                </select>
              {/if}
            </td>
          </tr>
          <tr>
            <td class="details_screen">{$LANG.sub_customer}</td>
            <td>
              {if $customers == null }
                <em>{$LANG.no_customers}</em>
              {else}
                <select name="custom_field1" id="custom_field1">
                  {foreach from=$sub_customers item=sub_customer}
                    <option {if isset($sub_customer.id) && $sub_customer.id == $defaultCustomerID}selected{/if} value="{if isset($sub_customer.id)}{$sub_customer.id|htmlsafe}{/if}">
                      {$sub_customer.attention|htmlsafe}
                    </option>
                  {/foreach}
                </select>
              {/if}
            </td>
          </tr>
          <tr>
            <td class="details_screen">{$LANG.date_formatted}</td>
            <td>
              <input type="text" class="validate[required,custom[date],length[0,10]] date-picker"
                     size="10" name="date" id="date1"
                     value="{if $smarty.get.date}{$smarty.get.date}{else}{$smarty.now|date_format:"%Y-%m-%d"}{/if}" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td>
