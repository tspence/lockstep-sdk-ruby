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
    # Represents a row of a trial balance report
    class TrialBalanceReportRowModel

        ##
        # Initialize the TrialBalanceReportRowModel using the provided prototype
        def initialize(params = {})
            @row_type = params.dig(:row_type)
            @label = params.dig(:label)
            @rows = params.dig(:rows)
            @cells = params.dig(:cells)
        end

        ##
        # @return [String] Describes what type of row this row is (Header, Summary, Classification, Category, Subcategory, Data)
        attr_accessor :row_type

        ##
        # @return [String] The label for the row if it is a Classification, Category, or Subcategory.
        attr_accessor :label

        ##
        # @return [TrialBalanceReportRowModel] The sub rows of this row if it is a Classification, Category, or Subcategory.
        attr_accessor :rows

        ##
        # @return [TrialBalanceReportCellModel] The cells of the row
        attr_accessor :cells

        ##
        # @return [object] This object as a JSON key-value structure
        def as_json(options={})
            {
                'rowType' => @row_type,
                'label' => @label,
                'rows' => @rows,
                'cells' => @cells,
            }
        end

        ##
        # @return [String] This object converted to a JSON string
        def to_json(*options)
            "[#{as_json(*options).to_json(*options)}]"
        end
    end
end
