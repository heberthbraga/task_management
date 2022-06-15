module ApplicationHelper
  
  def admin?
    current_user.admin?
  end

  def greetings
    now = Time.now
    today = Date.today.to_time
  
    morning = today.beginning_of_day
    noon = today.noon
    evening = today.change( hour: 17 )
    night = today.change( hour: 20 )
    tomorrow = today.tomorrow
  
    if (morning..noon).cover?(now)
      'common.greetings.morning'
    elsif (noon..evening).cover?(now)
      'common.greetings.afternoon'
    elsif (evening..night).cover?(now)
      'common.greetings.evening'
    elsif (night..tomorrow).cover?(now)
      'common.greetings.night'
    end
  end
end
