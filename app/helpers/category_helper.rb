module CategoryHelper

  def category_options(id=nil)
    {
      heading: 'categories.heading',
      headline: 'categories.headline',
      add_button_title: 'categories.add_button',
      new_path: new_category_path,
      turbo_frame_id: 'category_container'
    }
  end
end