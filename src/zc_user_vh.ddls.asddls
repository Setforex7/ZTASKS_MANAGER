@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Users Projection View Value Help'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_USER_VH as select from ZI_USER_VH
{
    key UserID,
        FullName,
        IsAdmin,
        Active,
        CreatedAt
}
