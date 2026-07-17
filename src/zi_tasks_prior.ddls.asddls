@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tasks Priorities Interface View'
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_TASKS_PRIOR 
    as select from zdt_tasks_prior
{
          @ObjectModel.text.element: ['PriorityDescription']
  key priority_code   as PriorityCode,

      @Semantics.text: true
      description    as PriorityDescription,
      ui_state as UiState,
      ui_icon as UiIcon,
      sort_order     as SortOrder
}
