#
# Lockstep Software Development Kit for Ruby
#
# (c) 2021-2022 Lockstep, Inc.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# @author     Ted Spence <tspence@lockstep.io>
# @copyright  2021-2022 Lockstep, Inc.
# @version    2021.39
# @link       https://github.com/Lockstep-Network/lockstep-sdk-ruby
#


class UserAccounts

    require 'awrence'

    def initialize(lockstepsdk) # Initialize the Activities class with a lockstepsdk instance.
        @lockstepsdk = lockstepsdk
    end

    #  Retrieves the User with this identifier.
    #  
    #  A User represents a person who has the ability to authenticate against the Lockstep Platform and use services such as Lockstep Insights.  A User is uniquely identified by an Azure identity, and each user must have an email address defined within their account.  All Users must validate their email to make use of Lockstep platform services.  Users may have different privileges and access control rights within the Lockstep Platform.
    #  
    #  @param id [uuid] The unique ID number of the User to retrieve
    #  @param include [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Notes, Attachments, CustomFields, AccountingRole
    def retrieve_user(include_param=nil, id:)
        path = "/api/v1/UserAccounts/#{id}"
        params = {:include => include_param}
        @lockstepsdk.request(:get, path, nil, params)
    end

    #  Updates a User that matches the specified id with the requested information.
    #  
    #  The PATCH method allows you to change specific values on the object while leaving other values alone.  As input you should supply a list of field names and new values.  If you do not provide the name of a field, that field will remain unchanged.  This allows you to ensure that you are only updating the specific fields desired.  A User represents a person who has the ability to authenticate against the Lockstep Platform and use services such as Lockstep Insights.  A User is uniquely identified by an Azure identity, and each user must have an email address defined within their account.  All Users must validate their email to make use of Lockstep platform services.  Users may have different privileges and access control rights within the Lockstep Platform.
    #  
    #  @param id [uuid] The unique ID number of the User to retrieve
    #  @param body [object] A list of changes to apply to this User
    def update_user(body:, id:)
        path = "/api/v1/UserAccounts/#{id}"
        @lockstepsdk.request(:patch, path, body.to_camelback_keys.to_json, nil)
    end

    #  Disable the user referred to by this unique identifier.
    #  
    #  A User represents a person who has the ability to authenticate against the Lockstep Platform and use services such as Lockstep Insights.  A User is uniquely identified by an Azure identity, and each user must have an email address defined within their account.  All Users must validate their email to make use of Lockstep platform services.  Users may have different privileges and access control rights within the Lockstep Platform.
    #  
    #  @param id [uuid] The unique Lockstep Platform ID number of this User
    def disable_user(id:)
        path = "/api/v1/UserAccounts/#{id}"
        @lockstepsdk.request(:delete, path, nil, nil)
    end

    #  Reenable the user referred to by this unique identifier.
    #  
    #  A User represents a person who has the ability to authenticate against the Lockstep Platform and use services such as Lockstep Insights.  A User is uniquely identified by an Azure identity, and each user must have an email address defined within their account.  All Users must validate their email to make use of Lockstep platform services.  Users may have different privileges and access control rights within the Lockstep Platform.
    #  
    #  @param id [uuid] The unique Lockstep Platform ID number of this User
    def reenable_user(id:)
        path = "/api/v1/UserAccounts/reenable"
        params = {:id => id}
        @lockstepsdk.request(:post, path, nil, params)
    end

    #  Invite a user with the specified email to join your accounting group. The user will receive an email to set up their account.
    #  
    #  A User represents a person who has the ability to authenticate against the Lockstep Platform and use services such as Lockstep Insights.  A User is uniquely identified by an Azure identity, and each user must have an email address defined within their account.  All Users must validate their email to make use of Lockstep platform services.  Users may have different privileges and access control rights within the Lockstep Platform.
    #  
    #  @param body [InviteSubmitModel] The user to invite
    def invite_user(body:)
        path = "/api/v1/UserAccounts/invite"
        @lockstepsdk.request(:post, path, body.to_camelback_keys.to_json, nil)
    end

    #  Retrieves invite information for the specified invite token.
    #  
    #  A User represents a person who has the ability to authenticate against the Lockstep Platform and use services such as Lockstep Insights.  A User is uniquely identified by an Azure identity, and each user must have an email address defined within their account.  All Users must validate their email to make use of Lockstep platform services.  Users may have different privileges and access control rights within the Lockstep Platform.
    #  @param code [uuid] The code of the invite
    def retrieve_invite_data(code:)
        path = "/api/v1/UserAccounts/invite"
        params = {:code => code}
        @lockstepsdk.request(:get, path, nil, params)
    end

    #  Transfer the ownership of a group to another user. This API must be called by the current owner of the group.
    #  
    #  A User represents a person who has the ability to authenticate against the Lockstep Platform and use services such as Lockstep Insights.  A User is uniquely identified by an Azure identity, and each user must have an email address defined within their account.  All Users must validate their email to make use of Lockstep platform services.  Users may have different privileges and access control rights within the Lockstep Platform.
    #  
    #  @param body [TransferOwnerSubmitModel] 
    def transfer_owner(body:)
        path = "/api/v1/UserAccounts/transfer-owner"
        @lockstepsdk.request(:post, path, body.to_camelback_keys.to_json, nil)
    end

    #  Queries Users for this account using the specified filtering, sorting, nested fetch, and pagination rules requested. A User represents a person who has the ability to authenticate against the Lockstep Platform and use services such as Lockstep Insights.  A User is uniquely identified by an Azure identity, and each user must have an email address defined within their account.  All Users must validate their email to make use of Lockstep platform services.  Users may have different privileges and access control rights within the Lockstep Platform.
    #  
    #  @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    #  @param include [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Notes, Attachments, CustomFields, AccountingRole
    #  @param order [string] The sort order for this query. See See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    #  @param pageSize [int32] The page size for results (default 200). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    #  @param pageNumber [int32] The page number for results (default 0). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    def query_users(pageSize = 200, pageNumber = 0, filter:, include_param:, order:)
        path = "/api/v1/UserAccounts/query"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => pageSize, :pageNumber => pageNumber}
        @lockstepsdk.request(:get, path, nil, params)
    end
end