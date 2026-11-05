CLASS zcl_space_age DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES age_in_years TYPE p LENGTH 3 DECIMALS 2.
    METHODS age
      IMPORTING
        planet        TYPE string
        seconds       TYPE i
      RETURNING
        VALUE(result) TYPE age_in_years
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_space_age IMPLEMENTATION.
  METHOD age.
    DATA years TYPE decfloat34.
    years = seconds / 31557600.

    result = SWITCH #( planet
      WHEN `Mercury` THEN years / '0.2408467'
      WHEN `Venus` THEN years / '0.61519726'
      WHEN `Earth` THEN years / '1.0'
      WHEN `Mars` THEN years / '1.8808158'
      WHEN `Jupiter` THEN years / '11.862615'
      WHEN `Saturn` THEN years / '29.447498'
      WHEN `Uranus` THEN years / '84.016846'
      WHEN `Neptune` THEN years / '164.79132'
      ELSE -1
     ).

    IF result = -1.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
  ENDMETHOD.


ENDCLASS.
