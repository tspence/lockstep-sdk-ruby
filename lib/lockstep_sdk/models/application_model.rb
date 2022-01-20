#
# Lockstep Software Development Kit for Ruby
#
# (c) 2021-2022 Lockstep, Inc.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# @author     Ted Spence <tspence@lockstep.io>
# @author     Manish Narayanan <manish.n@lockstep.io>
# @author     Rishi Rajkumar Jawahar <rjawahar@lockstep.io>
# @copyright  2021-2022 Lockstep, Inc.
# @version    2022.3
# @link       https://github.com/Lockstep-Network/lockstep-sdk-ruby
#


module LockstepSdk

    # An Application represents a feature available to customers within the Lockstep Platform.  You can create
    # Applications by working with your Lockstep business development manager and publish them on the platform
    # so that customers can browse and find your Application on the Lockstep Platform Marketplace.  When a
    # customer adds an Application to their account, they obtain an AppEnrollment which represents that customer's
    # instance of this Application.  The customer-specific AppEnrollment contains a customer's configuration data
    # for the Application, which is not customer-specific.
    # 
    # See [Applications and Enrollments](https://developer.lockstep.io/docs/applications-and-enrollments) for more information.
    # --swaggerCategory:Platform
    class ApplicationModel

        # Initialize the ApplicationModel using the provided prototype
        def initialize(params = {})
            @app_id = params.dig(:app_id)
            @name = params.dig(:name)
            @description = params.dig(:description)
            @app_type = params.dig(:app_type)
            @owner_id = params.dig(:owner_id)
            @project_url = params.dig(:project_url)
            @icon_url = params.dig(:icon_url)
            @price_terms = params.dig(:price_terms)
            @created_user_id = params.dig(:created_user_id)
            @modified_user_id = params.dig(:modified_user_id)
            @created = params.dig(:created)
            @modified = params.dig(:modified)
            @is_active = params.dig(:is_active)
            @wiki_url = params.dig(:wiki_url)
            @group_key = params.dig(:group_key)
            @notes = params.dig(:notes)
            @attachments = params.dig(:attachments)
            @custom_field_definitions = params.dig(:custom_field_definitions)
            @custom_field_values = params.dig(:custom_field_values)
        end

        # @return [Uuid] A unique code identifying this application
        attr_accessor :app_id
        # @return [String] The name of this application
        attr_accessor :name
        # @return [String] Brief summary of this application shown as a subtitle
        attr_accessor :description
        # @return [String] Tag for what type of app this is
        attr_accessor :app_type
        # @return [Uuid] The ID of the owner
        attr_accessor :owner_id
        # @return [Uri] The URL to visit for more information about this application
        attr_accessor :project_url
        # @return [Uri] The URL for the icon for this application
        attr_accessor :icon_url
        # @return [String] The description of the price for this application
        attr_accessor :price_terms
        # @return [Uuid] The ID of the user who created this application
        attr_accessor :created_user_id
        # @return [Uuid] The ID of the user who last modified this application
        attr_accessor :modified_user_id
        # @return [Date-time] The date this application was created
        attr_accessor :created
        # @return [Date-time] The date this application was last modified
        attr_accessor :modified
        # @return [Boolean] Flag indicating if the application is active.
        attr_accessor :is_active
        # @return [Uri] URL to the Wiki for the Application
        attr_accessor :wiki_url
        # @return [Uuid] The GroupKey uniquely identifies a single Lockstep Platform account. All records for this account will share the same GroupKey value. GroupKey values cannot be changed once created. For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
        attr_accessor :group_key
        # @return [NoteModel] All notes attached to this app. To retrieve this collection, specify `Notes` in the "Include" parameter for your query.
        attr_accessor :notes
        # @return [AttachmentModel] All attachments attached to this app. To retrieve this collection, specify `Attachments` in the "Include" parameter for your query.
        attr_accessor :attachments
        # @return [CustomFieldDefinitionModel] All definitions attached to the application. To retrieve this collection, specify `CustomFieldValues` in the "Include" parameter for your query.
        attr_accessor :custom_field_definitions
        # @return [CustomFieldValueModel] All values attached to the application. To retrieve this collection, specify `CustomFieldValues` in the "Include" parameter for your query.
        attr_accessor :custom_field_values
    end

    def as_json(options={})
        {
            'appId' => @app_id,
            'name' => @name,
            'description' => @description,
            'appType' => @app_type,
            'ownerId' => @owner_id,
            'projectUrl' => @project_url,
            'iconUrl' => @icon_url,
            'priceTerms' => @price_terms,
            'createdUserId' => @created_user_id,
            'modifiedUserId' => @modified_user_id,
            'created' => @created,
            'modified' => @modified,
            'isActive' => @is_active,
            'wikiURL' => @wiki_url,
            'groupKey' => @group_key,
            'notes' => @notes,
            'attachments' => @attachments,
            'customFieldDefinitions' => @custom_field_definitions,
            'customFieldValues' => @custom_field_values,
        }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end
end