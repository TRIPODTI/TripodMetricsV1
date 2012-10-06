module ApplicationHelper
  #hacer función fulltitle para entregar el nombre de la página
  def full_title(page_title)
    base_title = "Tripod Metrics"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
