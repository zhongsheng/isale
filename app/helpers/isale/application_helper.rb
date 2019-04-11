module Isale
  module ApplicationHelper
    # warp fontawesome, with default bootstrap btn style
    #   link_icon 'icon_name', 'link_name', 'link_path'
    # => <a href="link_path" class=" btn btn-sm btn-outline-secondary">
    # => <i class="fas fa-edit">link_name</i></a>
    def link_icon(icon, name=nil, options = nil, html_options = nil, &block )
      html_options, options, name = options, name, block if block_given?
      options ||= {}
      html_options = convert_options_to_data_attributes(options, html_options)
      url = url_for(options)
      html_options["href".freeze] ||= url
      if html_options["class"]
        html_options["class"] << " btn btn-sm btn-outline-secondary"
      else
        html_options["class"] = " btn btn-sm btn-outline-secondary"
      end
      content_tag("a".freeze,
                  (content_tag("i", '', class: "fas fa-#{icon}")+
                    content_tag("span", name, class: 'isale-a-name')),
                  html_options, &block)
    end
  end
end
