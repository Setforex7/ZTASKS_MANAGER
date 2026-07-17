@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Users Value Help'
define root view entity ZI_USER_VH as select from zdt_user
{
    @ObjectModel.text.element: ['FullName']
    key user_id as UserID,
    
    @Semantics.text: true
    full_name as FullName,
    
    is_admin as IsAdmin,
    active as Active,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt
}
where active = 'X'
