module ApplicationHelper
  def my_name
    "Bruno"
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def error_class(errors)
    'has_error' unless errors.empty?
  end

end
