module ApplicationHelper
  def icon_tag(cl, options = {})
    content_tag(:i, nil, options.merge({ class: cl }))
  end
end
