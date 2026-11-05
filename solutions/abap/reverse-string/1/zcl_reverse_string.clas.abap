CLASS zcl_reverse_string DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_reverse_string IMPLEMENTATION.

  METHOD reverse_string.
    DO strlen( input ) TIMES.
      DATA(lett) = strlen( input ) - sy-index.
      result &&= input+lett(1).
    ENDDO.
  ENDMETHOD.

ENDCLASS.
