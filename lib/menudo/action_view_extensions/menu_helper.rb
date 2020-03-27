module Menudo
  module ActionViewExtensions
    module MenuHelper
      def menudo_for(object, options = {}, &block)
        b = Menudo::MenuBuilder.new(self, object, options)
        if block_given?
          begin
            a = capture(&block)
          rescue
            block.yield(b)
            b.build
          else
            b.build do
              a
            end
          end
        else
          b.build_item
        end
      end


    end
  end
end

ActionView::Base.send :include, Menudo::ActionViewExtensions::MenuHelper