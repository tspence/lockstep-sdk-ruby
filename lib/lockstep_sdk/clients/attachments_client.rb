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

class AttachmentsClient

    ##
    # Initialize the AttachmentsClient class with an API client instance.
    # @param connection [LockstepApi] The API client object for this connection
    def initialize(connection)
        @connection = connection
    end


    ##
    # Retrieves the Attachment with the provided Attachment identifier.
    #
    # An Attachment is a file that can be attached to various account attributes within Lockstep. Attachments can be used for invoices, bills, or any other external files that you wish to track and have access to. Attachments represents an Attachment and a number of different metadata attributes related to the creation, storage, and ownership of the Attachment.
    #
    # See [Extensibility](https://developer.lockstep.io/docs/extensibility) for more information.
    #
    # @param id [uuid] The unique ID number of the Attachment to retrieve
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. No collections are currently available for querying but may be available in the future.
    def retrieve_attachment(id:, include_param:)
        path = "/api/v1/Attachments/#{id}"
        params = {:include => include_param}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Updates an existing Attachment with the information supplied to this PATCH call.
    #
    # The PATCH method allows you to change specific values on the object while leaving other values alone.  As input you should supply a list of field names and new values.  If you do not provide the name of a field, that field will remain unchanged.  This allows you to ensure that you are only updating the specific fields desired.
    #
    # An Attachment is a file that can be attached to various account attributes within Lockstep. Attachments can be used for invoices, bills, or any other external files that you wish to track and have access to. Attachments represents an Attachment and a number of different metadata attributes related to the creation, storage, and ownership of the Attachment.
    #
    # See [Extensibility](https://developer.lockstep.io/docs/extensibility) for more information.
    #
    # @param id [uuid] The unique Lockstep Platform ID number of the attachment to update
    # @param body [object] A list of changes to apply to this Attachment
    def update_attachment(id:, body:)
        path = "/api/v1/Attachments/#{id}"
        @connection.request(:patch, path, body.to_camelback_keys.to_json, nil)
    end

    ##
    # Flag this attachment as archived, which can distinguish between attachments currently active and attachments not intended for active use.  This is similar to deletion but preserves information about the record's existence.
    #
    # An Attachment is a file that can be attached to various account attributes within Lockstep. Attachments can be used for invoices, bills, or any other external files that you wish to track and have access to. Attachments represents an Attachment and a number of different metadata attributes related to the creation, storage, and ownership of the Attachment.
    #
    # See [Extensibility](https://developer.lockstep.io/docs/extensibility) for more information.
    #
    # @param id [uuid] The unique ID number of the Attachment to be archived
    def archive_attachment(id:)
        path = "/api/v1/Attachments/#{id}"
        @connection.request(:delete, path, nil, nil)
    end

    ##
    # Returns a URI for the Attachment file to be downloaded, based on the ID provided.
    #
    # An Attachment is a file that can be attached to various account attributes within Lockstep. Attachments can be used for invoices, bills, or any other external files that you wish to track and have access to. Attachments represents an Attachment and a number of different metadata attributes related to the creation, storage, and ownership of the Attachment.
    #
    # See [Extensibility](https://developer.lockstep.io/docs/extensibility) for more information.
    #
    # @param id [uuid] The unique ID number of the Attachment whose URI will be returned
    def download_attachment_url(id:)
        path = "/api/v1/Attachments/#{id}/download-url"
        @connection.request(:get, path, nil, nil)
    end

    ##
    # Returns the Attachment file to be downloaded, based on the ID provided.
    #
    # An Attachment is a file that can be attached to various account attributes within Lockstep. Attachments can be used for invoices, bills, or any other external files that you wish to track and have access to. Attachments represents an Attachment and a number of different metadata attributes related to the creation, storage, and ownership of the Attachment.
    #
    # See [Extensibility](https://developer.lockstep.io/docs/extensibility) for more information.
    #
    # @param id [uuid] The unique ID number of the Attachment whose URI will be returned
    def download_attachment_file(id:)
        path = "/api/v1/Attachments/#{id}/download-file"
        @connection.request(:get, path, nil, nil)
    end

    ##
    # Uploads and creates one or more Attachments from the provided arguments.
    #
    # An Attachment is a file that can be attached to various account attributes within Lockstep. Attachments can be used for invoices, bills, or any other external files that you wish to track and have access to. Attachments represents an Attachment and a number of different metadata attributes related to the creation, storage, and ownership of the Attachment.
    #
    # See [Extensibility](https://developer.lockstep.io/docs/extensibility) for more information.
    #
    # @param table_name [string] The name of the type of object to which this Attachment will be linked
    # @param object_id [uuid] The unique ID of the object to which this Attachment will be linked
    # @param attachment_type [string] The type of this attachment
    # @param filename [File] The full path of a file to upload to the API
    def upload_attachment(table_name:, object_id:, attachment_type:, filename:)
        path = "/api/v1/Attachments"
        params = {:tableName => table_name, :objectId => object_id, :attachmentType => attachment_type}
        @connection.request(:post, path, nil, params)
    end

    ##
    # Queries Attachments for this account using the specified filtering, sorting, nested fetch, and pagination rules requested.
    #
    # More information on querying can be found on the [Searchlight Query Language](https://developer.lockstep.io/docs/querying-with-searchlight) page on the Lockstep Developer website.
    #
    # An Attachment is a file that can be attached to various account attributes within Lockstep. Attachments can be used for invoices, bills, or any other external files that you wish to track and have access to. Attachments represents an Attachment and a number of different metadata attributes related to the creation, storage, and ownership of the Attachment.
    #
    # See [Extensibility](https://developer.lockstep.io/docs/extensibility) for more information.
    #
    # @param filter [string] The filter to use to select from the list of available Attachments, in the [Searchlight query syntax](https://github.com/tspence/csharp-searchlight).
    # @param include_param [string] To fetch additional data on this object, specify the list of elements to retrieve. No collections are currently available for querying but may be available in the future.
    # @param order [string] The sort order for the results, in the [Searchlight order syntax](https://github.com/tspence/csharp-searchlight).
    # @param page_size [int32] The page size for results (default 200, maximum of 10,000)
    # @param page_number [int32] The page number for results (default 0)
    def query_attachments(filter:, include_param:, order:, page_size:, page_number:)
        path = "/api/v1/Attachments/query"
        params = {:filter => filter, :include => include_param, :order => order, :pageSize => page_size, :pageNumber => page_number}
        @connection.request(:get, path, nil, params)
    end
end
