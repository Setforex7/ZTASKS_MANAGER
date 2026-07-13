@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Client Projection View'
@Metadata.allowExtensions: true
define root view entity ZC_CLIENT
  provider contract transactional_query
  as projection on ZI_Client
{
      key ClientUUID,
          ClientID,
          Name,
          Description,
          CreatedBy,
          CreatedAt,
          LastChangedBy,
          LastChangedAt,
          LocalLastChangedAt
}
