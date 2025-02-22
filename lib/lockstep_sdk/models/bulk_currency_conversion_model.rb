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
    # Input format used for bulk conversion route
    class BulkCurrencyConversionModel

        ##
        # Initialize the BulkCurrencyConversionModel using the provided prototype
        def initialize(params = {})
            @date = params.dig(:date)
            @source_currency = params.dig(:source_currency)
        end

        ##
        # @return [Date] The date for the currency rate
        attr_accessor :date

        ##
        # @return [String] The currency code This will be validated by the /api/v1/definitions/currencies data set
        attr_accessor :source_currency

        ##
        # @return [object] This object as a JSON key-value structure
        def as_json(options={})
            {
                'date' => @date,
                'sourceCurrency' => @source_currency,
            }
        end

        ##
        # @return [String] This object converted to a JSON string
        def to_json(*options)
            "[#{as_json(*options).to_json(*options)}]"
        end
    end
end
