@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Task Type Code List'
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_Tasks_types
  as select from zdt_tasks_types
{
      @ObjectModel.text.element: ['TypeDescription']
  key type_code   as TypeCode,

      @Semantics.text: true
      description    as TypeDescription,

      sort_order     as SortOrder
}
