@AbapCatalog.sqlViewName: 'Z_ITEMS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Invoice Items'
define view Z_INVOICE_ITEMS as select from sepm_sddl_so_invoice_item {

    //sepm_sddl_so_invoice_item
    header.buyer.company_name, 
    sepm_sddl_so_invoice_item.sales_order_invoice_key, 
    sepm_sddl_so_invoice_item.currency_code, 
    sepm_sddl_so_invoice_item.gross_amount,
    
    cast(
        case header.payment_status
            when 'P' then 'X'
            else ' '
        end as zso_invoice_payment_status )
    as payment_status,

    /* Associations */ 
    header 
    
}
where currency_code = 'USD'