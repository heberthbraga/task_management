module DashboardHelper
  
  def sidebar
    [
      [
        { name: 'Dashboard', icon: 'dashboard', path: dashboard_path },
        { name: 'Activities', icon: 'draft', path: '#' },
        { name: 'Tasks', icon: 'clipboard', path: '#' },
        { name: 'Analytics', icon: 'graph', path: '#' }
      ],
      [
        { name: 'Help', icon: 'chat', path: '#' },
        { name: 'Logout', icon: 'logout', path: destroy_user_session_path }
      ]
    ]
  end

  def embedded_svg_icon(name, options={})
    file_path = "#{Rails.root}/app/assets/images/icons/#{name}.svg"

    if File.exists?(file_path)
      cache file_path do
        file = File.read(file_path).html_safe
        doc = Nokogiri::HTML::DocumentFragment.parse(file)
        svg = doc.at_css('svg')
        svg['class'] = options[:class] if options[:class].present?

        return raw(svg)
      end
    else
      '(not found)'
    end
  end
  
end
