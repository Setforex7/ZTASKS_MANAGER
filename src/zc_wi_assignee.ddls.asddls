@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Work Item Assignee Projection View'
@Metadata.allowExtensions: true
define view entity ZC_WI_ASSIGNEE as projection on ZI_WI_ASSIGNEE

{
    key AssigneeUUID,
        WorkItemUUID,
        UserID,
        CreatedBy,
        CreatedAt,
        LastChangedBy,
        LastChangedAt,
        LocalLastChangedAt,
        
        _WorkItem : redirected to parent ZC_WorkItem,
        _User
}
