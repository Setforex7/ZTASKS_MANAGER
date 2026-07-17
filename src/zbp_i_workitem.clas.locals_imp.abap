CLASS lhc_zi_workitem DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_workitem RESULT result.

    METHODS checkDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_workitem~checkDates.

      METHODS setWorkItemID FOR DETERMINE ON SAVE
        IMPORTING keys FOR WorkItem~setWorkItemID.

ENDCLASS.

CLASS lhc_zi_workitem IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD checkDates.
  ENDMETHOD.

    METHOD setWorkItemID.

      READ ENTITIES OF zi_workitem IN LOCAL MODE
        ENTITY WorkItem
          FIELDS ( WorkItemID )
          WITH CORRESPONDING #( keys )
        RESULT DATA(lt_workitem).

      DELETE lt_workitem WHERE WorkItemID IS NOT INITIAL.
      CHECK lt_workitem IS NOT INITIAL.

      LOOP AT lt_workitem INTO DATA(ls_workitem).

        TRY.
            cl_numberrange_runtime=>number_get(
              EXPORTING
                nr_range_nr = '01'
                object      = 'ZWORKITEM'
              IMPORTING
                number      = DATA(lv_number) ).
          CATCH cx_number_ranges.
            CONTINUE.
        ENDTRY.

        MODIFY ENTITIES OF zi_workitem IN LOCAL MODE
          ENTITY WorkItem
            UPDATE FIELDS ( WorkItemID )
            WITH VALUE #( ( %tky       = ls_workitem-%tky
                            WorkItemID = |WI-{ lv_number+12(8) }| ) )
          REPORTED DATA(lt_reported).

      ENDLOOP.

    ENDMETHOD.

ENDCLASS.
