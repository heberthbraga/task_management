class AssetsNavbarComponent < ViewComponent::Base

  attr_reader :heading, :button_path, :button_title, :frame_id

  def initialize(options:)
    @heading = options[:heading]
    @button_path = options[:button_path]
    @button_title = options[:button_title]
    @frame_id = options[:frame_id]
  end
end