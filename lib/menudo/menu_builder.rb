module Menudo
  class MenuBuilder

    delegate :tag, :content_tag, :link_to, :capture, :pluralize, :t, :controller_name, :params, :can?, :deep_merge!, to: :@context

    def initialize(context, object, options)
      @context = context
      @object = object
      @options = options
      @childs = []
      # @node = Tree::TreeNode.new('root')
      # @current_ability = ::Ability.new(current_user)
      # @request = request
    end
    #
    # def initialize(collection, template, options)
    #   @collection = collection
    #   @options = options
    #   @template = template
    #   # @node = Tree::TreeNode.new('root')
    # end

    def build
      if @childs.present?
        build_item do |k|
          content_tag(:ul, class: "sidenav-menu #{ k[:active] ? ' active' : '' }", id: k[:key]) do
            @childs.each do |i|
              concat(build_item(i[:object], i[:options]) || '')
            end
          end
        end
      end
    end


    # def treat_can(permissions)
    #   case permissions
    #   when
    # end

    def build_item(object = @object, options = @options, &block)
      return unless authorize_items(object, options)

      path = options[:path]
      icon = options[:icon]
      key = ActiveSupport::Inflector.parameterize(object.to_s, separator: '_')
      label = options[:label] || t("controllers.#{key.pluralize}.other")
      li_options = { class: 'sidenav-item' }
      a_options = { class: 'sidenav-link' }
      if block_given?
        controllers = @childs.map{ |i| i[:options][:controller] } # verify nil, and this is important, dont be passed as an option
        item_active = controllers.present? && controllers.include?(controller_name)
        a_options = { class: "#{a_options[:class]} sidenav-toggle" }
        li_options = li_options.deep_merge!({ class: "#{li_options[:class]} active open" }) if item_active
        path = "##{key}"
      else
        active_parameter = options[:active_parameter]
        active_value = options[:active_value]

        if active_parameter.present? && active_value.present?
          li_options = li_options.deep_merge!({ class: "active #{li_options[:class]}" }) if controller_name == options[:controller] && params[active_parameter] == active_value.to_s
        else
          li_options = li_options.deep_merge!({ class: "active #{li_options[:class]}" }) if controller_name == options[:controller]
        end
      end
      content_tag :li, li_options do
        concat(link_to(path || '#', a_options) do
          concat(content_tag(:i, '', class: "sidenav-icon #{icon}")) if icon.present?
          concat(content_tag(:div, label))
        end)
        concat(capture({ key: key, active: item_active }, &block)) if block_given?
      end
    end

    def item(object, options = {})
      return unless authorize_items(object, options)

      @childs << { object: object, options: options }
    end

    def authorize_items(object, options = {})
      can = options[:can].presence || :read
      options[:controller] ||= auto_set_controller(object)
      can?(can.to_sym, object)
    end

    def auto_set_controller(object)
      case object.class
      when Class
        object.to_s.demodulize.pluralize.underscore
      when Symbol
        object.to_s.pluralize.underscore
      end
    end

    # def can?(*args)
    #   @current_ability.can?(*args)
    # end
    #
    # def cannot?(*args)
    #   @current_ability.can?(*args)
    # end
    def concat(tag)
      @context.safe_concat(tag)
      ''
    end
  end
end