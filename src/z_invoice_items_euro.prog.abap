*&---------------------------------------------------------------------*
*& Report z_invoice_items_euro
*&---------------------------------------------------------------------*
*&
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

    create object r_result.

  endmethod.

  method run.
    WRITE: 'Welcome, ', sy-uname, / 'Today is the', sy-datum.
  endmethod.

endclass.

*&---------------------------------------------------------------------*
*& Events
*&---------------------------------------------------------------------*
start-of-selection.

    lcl_main=>create( )->run( ).
