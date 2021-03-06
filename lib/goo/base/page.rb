module Goo
  module Base

    class Page < Array
      attr_accessor :page_number
      attr_accessor :page_size
      attr_accessor :next_page
      attr_accessor :aggregate

      def initialize(page_number,page_size,aggregate,data)
        super()
        @page_number = page_number
        @page_size = page_size
        @aggregate = aggregate
        self.concat data
      end

      def total_pages
        return 0 if (@page_size.nil? || @aggregate.nil?)
        (@aggregate / @page_size.to_f).ceil
      end

      def next?
        @page_number < total_pages
      end

      def prev?
        @page_number > 1
      end

      def next_page
        return next? ? page_number + 1 : nil
      end
      def prev_page
        return prev? ? page_number - 1 : nil
      end

    end

  end
end
