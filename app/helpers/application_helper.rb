module ApplicationHelper

    def title
    base_title = "LNKARA EDUCATION"
    if @title.nil?
      base_title
    else
      "#{@title} - #{base_title}"
    end
  end
end
