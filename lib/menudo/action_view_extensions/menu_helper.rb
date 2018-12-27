module Menudo
  module ActionViewExtensions
    module MenuHelper
      def menudo_for(object, options = {}, &block)
        b = Menudo::MenuBuilder.new(self, object, options)
        if block_given?
          block.yield(b)
          b.build
        else
          b.build_item
        end
      end


    end
  end
end

ActionView::Base.send :include, Menudo::ActionViewExtensions::MenuHelper