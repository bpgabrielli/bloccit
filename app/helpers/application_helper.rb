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

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end
end
