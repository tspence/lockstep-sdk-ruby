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

class SyncClient

    ##
    # Initialize the SyncClient class with an API client instance.
    # @param connection [LockstepApi] The API client object for this connection
    def initialize(connection)
        @connection = connection
    end


    ##
    # Requests a new Sync task from the Application specified in the request and returns a token that can be used to check the progress and status of the task.
    #
    # A Sync task represents an action performed by an Application for a particular account.  An Application can provide many different tasks as part of their capabilities.  Sync tasks are executed in the background and will continue running after they are created.  Use one of the creation APIs to request execution of a task. To check on the progress of the task, call GetSync or QuerySync.
    #
    # @param body [SyncSubmitModel] Information about the Sync to execute
    def create_sync(body:)
        path = "/api/v1/Sync"
        @connection.request(:post, path, body, nil)
    end

    ##
    # Creates a new batch import Sync task that imports all the models provided to this API call.
    #
    # A Sync task represents ingestion of data from a source.  For each data model in the source, the Sync process will determine whether the data is new, updated, or unchanged from data that already exists within the Lockstep Platform.  For records that are new, the Sync process will add them to the Lockstep Platform data.  For records that are updated, the Sync process will update existing data to match the newly uploaded records.  If records have not changed, no action will be taken.
    #
    # You can use this Batch Import process to load data in bulk directly into the Lockstep Platform.
    #
    # @param body [BatchSyncModel] Information about the Sync to execute
    def create_batch_import(body:)
        path = "/api/v1/Sync/batch"
        @connection.request(:post, path, body, nil)
    end

    ##
    # Requests a new Sync task from a ZIP file you provide.  This ZIP file can contain one or more files with data from the customer's platform.  Individual files can be in the format CSV or JSONL (JSON with Lines).
    #
    # A Sync task represents an action performed by an Application for a particular account.  An Application can provide many different tasks as part of their capabilities.  Sync tasks are executed in the background and will continue running after they are created.  Use one of the creation APIs to request execution of a task. To check on the progress of the task, call GetSync or QuerySync.
    #
    # @param filename [File] The full path of a file to upload to the API
    def upload_sync_file(filename:)
        path = "/api/v1/Sync/zip"
        @connection.request(:post, path, nil, nil)
    end

    ##
    # Updates an existing Sync with the information supplied to this PATCH call.
    #
    # This API is restricted to internal service users and may not be called by customers or partners.
    #
    # The PATCH method allows you to change specific values on the object while leaving other values alone.  As input you should supply a list of field names and new values.  For example, you can provide the field name "IsActive" and specify the new value "False"; this API will then change the value of IsActive to false.
    #
    # A Sync task represents an action performed by an Application for a particular account.  An Application can provide many different tasks as part of their capabilities.  Sync tasks are executed in the background and will continue running after they are created.  Use one of the creation APIs to request execution of a task. To check on the progress of the task, call GetSync or QuerySync.
    #
    # @param id [uuid] The unique ID number of the Sync to update
    # @param body [object] A list of changes to apply to this Application
    def update_sync(id:, body:)
        path = "/api/v1/Sync/#{id}"
        @connection.request(:patch, path, body.to_camelback_keys.to_json, nil)
    end

    ##
    # Retrieves the status and information about a Sync operation by the requested ID.  Provides status and progress information about this task.
    #
    # A Sync task represents an action performed by an Application for a particular account.  An Application can provide many different tasks as part of their capabilities.  Sync tasks are executed in the background and will continue running after they are created.  Use one of the creation APIs to request execution of a task. To check on the progress of the task, call GetSync or QuerySync.
    #
    # @param id [uuid] The unique ID number of the Sync task to retrieve
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Details
    def retrieve_sync(id:, include_param:)
        path = "/api/v1/Sync/#{id}"
        params = {:include => include_param}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Cancels a Sync process for an Application if the request is still being processed within the Application. This does not cancel Sync processes which have already proceeded to completion within the Application, or Sync processes outside of Applications such as from a Zip file or Batch Import.
    #
    # A Sync task represents an action performed by an Application for a particular account.  An Application can provide many different tasks as part of their capabilities.  Sync tasks are executed in the background and will continue running after they are created.  Use one of the creation APIs to request execution of a task. To check on the progress of the task, call GetSync or QuerySync.
    #
    # @param id [uuid] The unique ID number of the Sync task to cancel
    def cancel_sync(id:)
        path = "/api/v1/Sync/#{id}"
        @connection.request(:delete, path, nil, nil)
    end

    ##
    # Queries Sync tasks for this account using the specified filtering, sorting, nested fetch, and pagination rules requested.
    #
    # More information on querying can be found on the [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight) page on the Lockstep Developer website.
    #
    # A Sync task represents an action performed by an Application for a particular account.  An Application can provide many different tasks as part of their capabilities.  Sync tasks are executed in the background and will continue running after they are created.  Use one of the creation APIs to request execution of a task. To check on the progress of the task, call GetSync or QuerySync.
    #
    # @param filter [string] The filter for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. Available collections: Details
    # @param order [string] The sort order for this query. See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param page_size [int32] The page size for results (default 200). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    # @param page_number [int32] The page number for results (default 0). See [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight)
    def query_syncs(filter:, include_param:, order:, page_size:, page_number:)
        path = "/api/v1/Sync/query"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => page_size, :pageNumber => page_number}
        @connection.request(:get, path, nil, params)
    end
end
