class zcl_invoice_retrieval definition
  public
  final
  create public .

public section.

    types: ty_table_of_zso_invoice_item type standard table of zso_invoice_item with default key.

    methods get_items_from_db
      returning
        value(lt_result) type ty_table_of_zso_invoice_item.

protected section.

private section.

endclass.

class zcl_invoice_retrieval implementation.

  method get_items_from_db.

    select
        snwd_bpa~company_name,
        snwd_so_inv_item~gross_amount,
        snwd_so_inv_item~currency_code,
        snwd_so_inv_head~payment_status
    from snwd_so_inv_item
    join snwd_so_inv_head
    on snwd_so_inv_item~parent_key = snwd_so_inv_head~node_key
    join snwd_bpa
    on snwd_so_inv_head~buyer_guid = snwd_bpa~node_key
    where snwd_so_inv_item~currency_code = 'USD'
    order by  snwd_bpa~company_name
    into table @lt_result.

    LOOP AT lt_result ASSIGNING FIELD-SYMBOL(<entry>).
        CASE <entry>-payment_status.
            WHEN 'P'.
                <entry>-payment_status = abap_true.
            WHEN OTHERS.
                <entry>-payment_status = abap_false.
        ENDCASE.
    ENDLOOP.

  endmethod.

endclass.
