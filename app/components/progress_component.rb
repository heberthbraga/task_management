class ProgressComponent < ViewComponent::Base
  
  attr_reader :space_x

  def initialize(space_x:)
    @space_x = space_x
  end
end