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


require 'json'

module LockstepSdk

    ##
    # Represents the response to either a successful or failed account provisioning
    class ProvisioningResponseModel

        ##
        # Initialize the ProvisioningResponseModel using the provided prototype
        def initialize(params = {})
            @user_name = params.dig(:user_name)
            @account_name = params.dig(:account_name)
            @user_id = params.dig(:user_id)
            @group_key = params.dig(:group_key)
            @app_enrollment_id = params.dig(:app_enrollment_id)
            @sync_request_id = params.dig(:sync_request_id)
            @error_message = params.dig(:error_message)
        end

        ##
        # @return [String] If provisioning is successful, contains the username of the created user.
        attr_accessor :user_name

        ##
        # @return [String] If provisioning is successful, contains subscription account name of created user.
        attr_accessor :account_name

        ##
        # @return [Uuid] If provisioning is successful, contains the unique identifier of the created user.
        attr_accessor :user_id

        ##
        # @return [Uuid] If provisioning is successful, contains the group key of the created user.
        attr_accessor :group_key

        ##
        # @return [Uuid] If provisioning is successful, contains the app enrollment id of the created app enrollment.
        attr_accessor :app_enrollment_id

        ##
        # @return [Uuid] if provisioning is successful, contains the sync request id of the sync that was started for the app enrollment.
        attr_accessor :sync_request_id

        ##
        # @return [String] The error message(s).
        attr_accessor :error_message

        ##
        # @return [object] This object as a JSON key-value structure
        def as_json(options={})
            {
                'userName' => @user_name,
                'accountName' => @account_name,
                'userId' => @user_id,
                'groupKey' => @group_key,
                'appEnrollmentId' => @app_enrollment_id,
                'syncRequestId' => @sync_request_id,
                'errorMessage' => @error_message,
            }
        end

        ##
        # @return [String] This object converted to a JSON string
        def to_json(*options)
            "[#{as_json(*options).to_json(*options)}]"
        end
    end
end
