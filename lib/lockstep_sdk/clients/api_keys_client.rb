#
# Lockstep Platform SDK for Ruby
#
# (c) 2021-2022 Lockstep, Inc.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# @author     Lockstep Network <support@lockstep.io>
# @copyright  2021-2022 Lockstep, Inc.
# @link       https://github.com/Lockstep-Network/lockstep-sdk-ruby
#


require 'awrence'

class ApiKeysClient

    ##
    # Initialize the ApiKeysClient class with an API client instance.
    # @param connection [LockstepApi] The API client object for this connection
    def initialize(connection)
        @connection = connection
    end


    ##
    # Retrieves the API Key with this identifier.
    #
    # An API Key is an authentication token that you may use with the Lockstep API.  Because API Keys do not have an expiration date, they are well suited for unattended processes.  Each API Key is associated with a user, and may be revoked to prevent it from accessing the Lockstep API. When you create an API Key, make sure to save the value in a secure location.  Lockstep cannot retrieve an API Key once it is created.
    #
    # For more information, see [API Keys](https://developer.lockstep.io/docs/api-keys).
    #
    # @param id [uuid] The unique ID number of the API Key to retrieve
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. No collections are currently available but may be offered in the future.
    def retrieve_api_key(id:, include_param:)
        path = "/api/v1/ApiKeys/#{id}"
        params = {:include => include_param}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Immediately revokes the API Key with the specified id so it cannot be used to call the API.
    #
    # The Lockstep Platform guarantees that revocation will be received by all servers within five minutes of revocation.  API calls made using this API key after the revocation will fail.  A revoked API Key cannot be un-revoked and may be removed 60 days after revocation.
    #
    # An API Key is an authentication token that you may use with the Lockstep API.  Because API Keys do not have an expiration date, they are well suited for unattended processes.  Each API Key is associated with a user, and may be revoked to prevent it from accessing the Lockstep API. When you create an API Key, make sure to save the value in a secure location.  Lockstep cannot retrieve an API Key once it is created.
    #
    # For more information, see [API Keys](https://developer.lockstep.io/docs/api-keys).
    #
    # @param id [uuid] The unique Lockstep Platform ID number of this API Key
    def revoke_api_key(id:)
        path = "/api/v1/ApiKeys/#{id}"
        @connection.request(:delete, path, nil, nil)
    end

    ##
    # Creates an API key with the specified name.
    #
    # An API Key is an authentication token that you may use with the Lockstep API.  Because API Keys do not have an expiration date, they are well suited for unattended processes.  Each API Key is associated with a user, and may be revoked to prevent it from accessing the Lockstep API. When you create an API Key, make sure to save the value in a secure location.  Lockstep cannot retrieve an API Key once it is created.
    #
    # For more information, see [API Keys](https://developer.lockstep.io/docs/api-keys).
    #
    # @param body [ApiKeyModel] Metadata about the API Key to create.
    def create_api_key(body:)
        path = "/api/v1/ApiKeys"
        @connection.request(:post, path, body, nil)
    end

    ##
    # Queries API Keys for this user using the specified filtering, sorting, nested fetch, and pagination rules requested.
    #
    # An API Key is an authentication token that you may use with the Lockstep API.  Because API Keys do not have an expiration date, they are well suited for unattended processes.  Each API Key is associated with a user, and may be revoked to prevent it from accessing the Lockstep API. When you create an API Key, make sure to save the value in a secure location.  Lockstep cannot retrieve an API Key once it is created.
    #
    # For more information, see [API Keys](https://developer.lockstep.io/docs/api-keys).
    #
    # @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. No collections are currently available but may be offered in the future.
    # @param order [string] The sort order for this query. See See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param page_size [int32] The page size for results (default 200). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param page_number [int32] The page number for results (default 0). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    def query_api_keys(filter:, include_param:, order:, page_size:, page_number:)
        path = "/api/v1/ApiKeys/query"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => page_size, :pageNumber => page_number}
        @connection.request(:get, path, nil, params)
    end
end
