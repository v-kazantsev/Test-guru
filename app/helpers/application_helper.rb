module ApplicationHelper
  def page_title
    content_for(:page_title) || "Проект Тест Гуру"
  end
end
