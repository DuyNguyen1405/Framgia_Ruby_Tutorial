module ApplicationHelper
  def full_title page_title = ""
    base_title = t "title"
    @full_title = page_title + " | " + base_title
    if page_title.empty?
      base_title
    else
      full_title
    end
  end
end
