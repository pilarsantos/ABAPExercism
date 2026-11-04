CLASS zcl_atbash_cipher DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS decode
      IMPORTING
        cipher_text TYPE string
      RETURNING
        VALUE(plain_text)  TYPE string .
    METHODS encode
      IMPORTING
        plain_text        TYPE string
      RETURNING
        VALUE(cipher_text) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_atbash_cipher IMPLEMENTATION.
  
  METHOD decode.
    DATA(abc) = `abcdefghijklmnopqrstuvwxyz`.
    DATA(texto) = to_lower( cipher_text ).
  
    DO strlen( texto ) TIMES.

      DATA(lett) = sy-index - 1.
      DATA(pos) = find( val = abc sub = texto+lett(1) ). 

      IF pos <> -1.
        DATA(lett2) = strlen( abc ) - 1 - pos.
        plain_text &&= abc+lett2(1).

      ELSEIF texto+lett(1) CO `0123456789`.
        plain_text &&= texto+lett(1).
      ENDIF.
      
    ENDDO.
  ENDMETHOD.

  METHOD encode.
    DATA(abc) = `abcdefghijklmnopqrstuvwxyz`.
    DATA(texto) = to_lower( plain_text ).
    DATA(acc) = 0.
    
    DO strlen( texto ) TIMES.

      DATA(lett) = sy-index - 1.
      DATA(pos) = find( val = abc sub = texto+lett(1) ). 

      IF pos <> -1.
        IF acc > 0 AND acc MOD 5 = 0.
          cipher_text &&= ` `.
        ENDIF.
        
        acc += 1.
        
        DATA(lett2) = strlen( abc ) - 1 - pos.
        cipher_text &&= abc+lett2(1).

      ELSEIF texto+lett(1) CO `0123456789`.
        IF acc > 0 AND acc MOD 5 = 0.
          cipher_text &&= ` `.
        ENDIF.
        
        acc += 1.
        
        cipher_text &&= texto+lett(1).
      ENDIF.
      
    ENDDO.
  ENDMETHOD.
ENDCLASS.
