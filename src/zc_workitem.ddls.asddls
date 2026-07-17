@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Work Item Projection View'
@Metadata.allowExtensions: true
define root view entity ZC_WorkItem
  provider contract transactional_query
  as projection on zi_workitem
{
      key WorkItemUUID,
          WorkItemID,
          ClientUUID,
          Title,
          Description,
          StatusCode,
          TypeCode,
          PriorityCode,
          StartDate,
          DueDate,
          CreatedBy,
          CreatedAt,
          LastChangedBy,
          LastChangedAt,
          LocalLastChangedAt,

          _Assignee : redirected to composition child ZC_WI_ASSIGNEE,
          _Client  : redirected to ZC_CLIENT,
          _Status,
          _Priority
}
