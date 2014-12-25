module ApplicationHelper

  # Return a page title
  def full_title(title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if title.nil?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end


end
