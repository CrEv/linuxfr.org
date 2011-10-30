module FormHelper

  def messages_on_error(object)
    return '' if object.errors.count.zero?
    content_tag(:div, :class => "errors") do
      content_tag(:h2, pluralize(object.errors.count, "erreur") + ' : ') +
      content_tag(:ul) do
        safe_join object.errors.values.flatten.map do |err|
          content_tag(:li, err)
        end
      end
    end
  end

end
