ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  fragment = Nokogiri::HTML.fragment(html_tag)
  field = fragment.at('input,select,textarea')

  html = if field
           error_message = instance.error_message.join(', ')
           field['class'] = 'input-field-error'
           html = <<-HTML
              #{fragment.to_s}
              <p class="mt-1 text-sm text-red-500">#{error_message.upcase_first}</p>
           HTML
           html
         else
           html_tag
         end

  html.html_safe
end