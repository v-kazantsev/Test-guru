module ApplicationHelper
  def page_title
    content_for(:page_title) || "Проект Тест Гуру"
  end

  def flash_helper(flash)
    tag.div do
      flash.map do |key, value|
        tag.p value, id: key
      end.join.html_safe
    end
  end

end
