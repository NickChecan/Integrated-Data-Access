*&---------------------------------------------------------------------*
*& Report z_invoice_items_euro
*&---------------------------------------------------------------------*
report z_invoice_items_euro.

*&---------------------------------------------------------------------*
*& Classes
*&---------------------------------------------------------------------*
class lcl_main definition create private.

  public section.

    class-methods create
      returning
        value(r_result) type ref to lcl_main.

    methods: run.

  protected section.

  private section.

endclass.

class lcl_main implementation.

  method create.

    r_result = new #( ).

  endmethod.

  method run.

    data(invoices) = new zcl_invoice_retrieval( ).

    data(invoice_items) = invoices->get_items_from_db( ).

    cl_salv_table=>factory(
      importing
        r_salv_table   = data(alv_table)
      changing
        t_table        = invoice_items
    ).

    alv_table->display( ).

  endmethod.

endclass.

*&---------------------------------------------------------------------*
*& Events
*&---------------------------------------------------------------------*
start-of-selection.

    lcl_main=>create( )->run( ).
