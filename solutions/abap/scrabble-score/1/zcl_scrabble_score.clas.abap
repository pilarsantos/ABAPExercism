CLASS zcl_scrabble_score DEFINITION PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_scrabble_score IMPLEMENTATION.
  METHOD score.
    DATA(p1) = `aeioulnrst`.
    DATA(p2) = `dg`.
    DATA(p3) = `bcmp`.
    DATA(p4) = `fhvwy`.
    DATA(p5) = `k`.
    DATA(p8) = `jx`.
    DATA(p10) = `qz`.

    DO strlen( input ) TIMES.
      DATA(lett) = sy-index - 1.

      IF p1 CS input+lett(1).
        result += 1.

        ELSEIF p2 CS input+lett(1).
          result += 2.

        ELSEIF p3 CS input+lett(1).
          result += 3.

        ELSEIF p4 CS input+lett(1).
          result += 4.

        ELSEIF p5 CS input+lett(1).
          result += 5.

        ELSEIF p8 CS input+lett(1).
          result += 8.

        ELSEIF p10 CS input+lett(1).
          result += 10.
      ENDIF.
    ENDDO.
     
  ENDMETHOD.

ENDCLASS.
