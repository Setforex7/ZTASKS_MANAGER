@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Client Interface View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_Client
  as select from zdt_client
{
  key client_uuid as ClientUUID,
      client_id as ClientID,
      name as Name,
      description as Description,

      @Semantics.user.createdBy: true
      created_by as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt
}
