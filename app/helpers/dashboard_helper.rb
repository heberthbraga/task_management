module DashboardHelper

  MAIN_CONTENT_ID = 'dashboard_main_content'

  def render_sidebar
    sidebar.each_with_index do |group, index|
      concat(render_sidebar_group(group, index))
    end
  end

  def render_navbar(options)
    render('shared/dashboard/navbar', options)
  end

  private

  def render_sidebar_group(group, index)
    content_tag(:ul, class: "flex flex-col gap-y-6 #{group_class(index)}") do
      group.each { |item| concat(render_sibebar_item(item)) }
    end.html_safe
  end

  def render_sibebar_item(item)
    content_tag(:li) do
      link_to(item[:path], 
        class: 'text-slate-100 flex p-2 text-base gap-x-4 items-center rounded-lg hover:bg-teal-600'
      ) do
        embedded_svg_icon(item[:icon]).concat(
        content_tag(:span, data: { 'sidebar-target': 'anchorName' } ) do
          item[:name]
        end)
      end
    end.html_safe
  end

  def group_class(index)
    index == 0 ? 'mt-20' : 'border-t border-slate-100 mt-12 pt-6'
  end

  def sidebar
    admin? ? admin_sidebar : user_sidebar
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

  def user_sidebar
    [
      [
        dashboard_side_path,
        { name: 'Activities', icon: 'draft', path: '#' },
        { name: 'Tasks', icon: 'clipboard', path: '#' },
        { name: 'Analytics', icon: 'graph', path: '#' }
      ],
      bottom_sidebar
    ]
  end

  def admin_sidebar
    [
      [
        dashboard_side_path,
        { name: 'Categories', icon: 'draft', path: categories_path },
      ],
      bottom_sidebar
    ]
  end

  def dashboard_side_path
    { name: 'Dashboard', icon: 'dashboard', path: dashboard_path }
  end

  def bottom_sidebar
    [
      { name: 'Help', icon: 'chat', path: '#' },
      { name: 'Logout', icon: 'logout', path: destroy_user_session_path }
    ]
  end
end