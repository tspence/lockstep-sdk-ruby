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

class CurrenciesClient

    ##
    # Initialize the CurrenciesClient class with an API client instance.
    # @param connection [LockstepApi] The API client object for this connection
    def initialize(connection)
        @connection = connection
    end


    ##
    # Retrieve a currency conversation rate from one currency to another as of the specified date.              Optionally, you can specify which currency data provider to use.
    #
    #              The currency rate model contains all of the information used to make the API call, plus the rate to              use for the conversion.
    #
    # @param source_currency [string] The ISO 4217 currency code of the origin currency. For a list of currency codes, call List Currencies.
    # @param destination_currency [string] The ISO 4217 currency code of the target currency. For a list of currency codes, call List Currencies.
    # @param date [date] The date for which we should cto use for this currency conversion.
    # @param data_provider [string] Optionally, you can specify a data provider.
    def retrieve_currency_rate(source_currency:, destination_currency:, date:, data_provider:)
        path = "/api/v1/Currencies/#{sourceCurrency}/#{destinationCurrency}"
        params = {:date => date, :dataProvider => data_provider}
        @connection.request(:get, path, nil, params)
    end

    ##
    # Receives an array of dates and currencies and a destination currency and returns an array of the corresponding currency rates to the given destination currency (Limit X).
    #
    # @param destination_currency [string] The currency to convert to.
    # @param body [BulkCurrencyConversionModel] A list of dates and source currencies.
    def bulk_currency_data(destination_currency:, body:)
        path = "/api/v1/Currencies/bulk"
        params = {:destinationCurrency => destination_currency}
        @connection.request(:post, path, body, params)
    end
end
