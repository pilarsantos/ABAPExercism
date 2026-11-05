CLASS zcl_beer_song DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS recite
      IMPORTING
        !initial_bottles_count TYPE i
        !take_down_count       TYPE i
      RETURNING
        VALUE(result)          TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_beer_song IMPLEMENTATION.

  METHOD recite.
    DATA(bottles) = initial_bottles_count.
    
    DO take_down_count TIMES.
    
      IF sy-index > 1.
        APPEND `` TO result.
      ENDIF.

      CASE bottles.
      WHEN 0.
        APPEND `No more bottles of beer on the wall, no more bottles of beer.` TO result.
        APPEND `Go to the store and buy some more, 99 bottles of beer on the wall.` TO result.
      WHEN 1.
        APPEND `1 bottle of beer on the wall, 1 bottle of beer.` TO result.
        APPEND `Take it down and pass it around, no more bottles of beer on the wall.` TO result.
      WHEN 2.
        APPEND `2 bottles of beer on the wall, 2 bottles of beer.` TO result.
        APPEND `Take one down and pass it around, 1 bottle of beer on the wall.` TO result.
      WHEN OTHERS.
        APPEND |{ bottles } bottles of beer on the wall, { bottles } bottles of beer.| TO result.
        APPEND |Take one down and pass it around, { bottles - 1 } bottles of beer on the wall.| TO result.
      ENDCASE.

      bottles -= 1.
      
    ENDDO.
  ENDMETHOD.

ENDCLASS.
