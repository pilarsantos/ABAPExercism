CLASS zcl_pangram DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS is_pangram
      IMPORTING
        VALUE(sentence) TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_pangram IMPLEMENTATION.
  METHOD is_pangram.
    DATA(abc) = `abcdefghijklmnopqrstuvwxyz`.

    DO strlen( abc ) TIMES.
      DATA(lett) = sy-index - 1.
      
      IF sentence NS abc+lett(1).
        result = abap_false.
        RETURN.
      ENDIF.
    ENDDO.

    result = abap_true.
    
  ENDMETHOD.

ENDCLASS.
