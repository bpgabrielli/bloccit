module ApplicationHelper
  def my_name
    "Bruno"
  end

  def form_group_tag(errors)
    if errors.any?
      "class='form-group has-error'"
    else
      "class='form-group'"
    end
  end
end
