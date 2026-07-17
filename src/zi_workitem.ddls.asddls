@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Work Item Interface View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_workitem
    as select from zdt_workitem
    
    association [1..1] to ZI_Client as _Client on $projection.ClientUUID = _Client.ClientUUID
    association [0..1] to ZI_Tasks_Status as _Status on $projection.StatusCode = _Status.StatusCode
    association [0..1] to ZI_TASKS_PRIOR as _Priority on $projection.PriorityCode = _Priority.PriorityCode
    composition [0..*] of ZI_WI_ASSIGNEE as _Assignee
{
    key workitem_uuid   as WorkItemUUID,
      workitem_id     as WorkItemID,
      client_uuid     as ClientUUID,
      title           as Title,
      description     as Description,
      status_code     as StatusCode,
      type_code       as TypeCode,
      priority_code   as PriorityCode,
      start_date      as StartDate,
      due_date        as DueDate,

      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      
      _Client,
      _Status,
      _Assignee,
      _Priority
}
