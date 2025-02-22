#
# Lockstep Software Development Kit for Ruby
#
# (c) 2021-2022 Lockstep, Inc.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# @author     Ted Spence <tspence@lockstep.io>
# @author     Manish Narayan B S <manish.n@lockstep.io>
# @author     Rishi Rajkumar Jawahar <rjawahar@lockstep.io>
# @copyright  2021-2022 Lockstep, Inc.
# @link       https://github.com/Lockstep-Network/lockstep-sdk-ruby
#


require 'json'

module LockstepSdk

    ##
    # Represents a Trial Balance Report
    class TrialBalanceReportModel

        ##
        # Initialize the TrialBalanceReportModel using the provided prototype
        def initialize(params = {})
            @report_name = params.dig(:report_name)
            @group_key = params.dig(:group_key)
            @report_start_date = params.dig(:report_start_date)
            @report_end_date = params.dig(:report_end_date)
            @report_created_date = params.dig(:report_created_date)
            @rows = params.dig(:rows)
        end

        ##
        # @return [String] The name of the report ("Trial Balance for *Company*")
        attr_accessor :report_name

        ##
        # @return [Uuid] The GroupKey uniquely identifies a single Lockstep Platform account. All records for this account will share the same GroupKey value. GroupKey values cannot be changed once created. For more information, see [Accounts and GroupKeys](https://developer.lockstep.io/docs/accounts-and-groupkeys).
        attr_accessor :group_key

        ##
        # @return [Date-time] The start date of the trial balance report
        attr_accessor :report_start_date

        ##
        # @return [Date-time] The end date of the trial balance report
        attr_accessor :report_end_date

        ##
        # @return [Date-time] The created date of the trial balance report
        attr_accessor :report_created_date

        ##
        # @return [TrialBalanceReportRowModel] The rows of the trial balance report
        attr_accessor :rows

        ##
        # @return [object] This object as a JSON key-value structure
        def as_json(options={})
            {
                'reportName' => @report_name,
                'groupKey' => @group_key,
                'reportStartDate' => @report_start_date,
                'reportEndDate' => @report_end_date,
                'reportCreatedDate' => @report_created_date,
                'rows' => @rows,
            }
        end

        ##
        # @return [String] This object converted to a JSON string
        def to_json(*options)
            "[#{as_json(*options).to_json(*options)}]"
        end
    end
end
