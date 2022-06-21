class TabPaneComponent < ViewComponent::Base

  attr_reader :id, :options

  def initialize(pane:)
    @id = pane[:id]
    @options = pane[:options]
  end

  def render_pane_option(option)
    render TabPaneOptionComponent.new(option: option)
  end
end