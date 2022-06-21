class TabPaneOptionComponent < ViewComponent::Base

  attr_reader :option

  def initialize(option:)
    @option = option
  end
end