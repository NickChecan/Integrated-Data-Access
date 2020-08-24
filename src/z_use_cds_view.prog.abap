*&---------------------------------------------------------------------*
*& Report z_invoice_items_euro
*&---------------------------------------------------------------------*
report z_use_cds_view.

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

    cl_salv_gui_table_ida=>create_for_cds_view(
        'Z_INVOICE_ITEMS' " Name of the CDS View
    )->fullscreen( )->display( ).

  endmethod.

endclass.

*&---------------------------------------------------------------------*
*& Events
*&---------------------------------------------------------------------*
start-of-selection.

    lcl_main=>create( )->run( ).
