module ApplicationHelper
  def page_title
    content_for(:page_title) || "Проект Тест Гуру"
  end

  def flash_helper(flash)
    if flash[:alert]
      tag.p flash [:alert]
    elsif flash [:notice]
      tag.p flash [:notice]
    end
  end
end
