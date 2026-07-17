@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Work Item Assignee Interface View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_WI_ASSIGNEE as select from zdt_wi_assignee

    association to parent zi_workitem as _WorkItem on $projection.WorkItemUUID = _WorkItem.WorkItemUUID
    association [0..1] to ZI_USER_VH as _User on $projection.UserID = _User.UserID
{
    key assignee_uuid as AssigneeUUID,
        workitem_uuid as WorkItemUUID,
        user_id as UserID,
        @Semantics.user.createdBy: true
        created_by as CreatedBy,
        @Semantics.systemDateTime.createdAt: true
        created_at as CreatedAt,
        @Semantics.user.lastChangedBy: true
        last_changed_by as LastChangedBy,
        @Semantics.systemDateTime.lastChangedAt: true
        last_changed_at as LastChangedAt,
        @Semantics.systemDateTime.localInstanceLastChangedAt: true
        local_last_changed_at as LocalLastChangedAt,
        
        _WorkItem,
        _User
}
