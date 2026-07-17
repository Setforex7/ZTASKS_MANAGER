@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Task Status Code List'
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_Tasks_Status
  as select from zdt_tasks_status
{
      @ObjectModel.text.element: ['StatusDescription']
  key status_code   as StatusCode,

      @Semantics.text: true
      description    as StatusDescription,

      sort_order     as SortOrder
}
