class NotificationComponent < ViewComponent::Base
  attr_reader :type, :data, :icon_class, :icon_color_class, :timeout

  def initialize(type:, data:)
    @type = type
    @data = prepare_data(data)
    @icon_class = icon_class
    @icon_color_class = icon_color_class
    
    @data[:timeout] ||= 3
    @data[:countdown] ||= false
  end

private

  def prepare_data(data)
    case data
    when Hash
      data.deep_symbolize_keys
    else
      { title: data }
    end
  end

  def icon_class
    case type
    when 'success'
      'fa-square-check'
    when 'error'
      'fa-circle-exclamation'
    when 'alert'
      'fa-circle-exclamation'
    else
      'fa-circle-info'
    end
  end

  def icon_color_class
    case type
    when 'success'
      'text-green-600'
    when 'error'
      'text-red-800'
    when 'alert'
      'text-red-400'
    else
      'text-gray-400'
    end
  end
end