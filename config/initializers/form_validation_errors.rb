ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  html = html_tag.to_s
  next html.html_safe if html.start_with?("<label")

  match = html.match(/class\s*=\s*"([^"]*)"/)
  if match
    html.sub(match[0], "class=\"#{match[1]} input-with-errors\"").html_safe
  else
    html.sub(/\A<(\w+)/, '<\1 class="input-with-errors"').html_safe
  end
end
