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
    # Represents unsupported ERP systems
    class ErpModel

        ##
        # Initialize the ErpModel using the provided prototype
        def initialize(params = {})
            @erp_system_id = params.dig(:erp_system_id)
            @name = params.dig(:name)
            @is_supported = params.dig(:is_supported)
        end

        ##
        # @return [Uuid] Unique ID for this ERP
        attr_accessor :erp_system_id

        ##
        # @return [String] Name of ERP
        attr_accessor :name

        ##
        # @return [Boolean] Flag to indicate if ERP is supported
        attr_accessor :is_supported

        ##
        # @return [object] This object as a JSON key-value structure
        def as_json(options={})
            {
                'erpSystemId' => @erp_system_id,
                'name' => @name,
                'isSupported' => @is_supported,
            }
        end

        ##
        # @return [String] This object converted to a JSON string
        def to_json(*options)
            "[#{as_json(*options).to_json(*options)}]"
        end
    end
end
