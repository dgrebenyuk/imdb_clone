module ApplicationHelper
  def icon_tag(cl)
    content_tag(:i, nil, class: cl)
  end
end
