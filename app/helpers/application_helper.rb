module ApplicationHelper
  def page_title
    content_for(:page_title) || "Проект Тест Гуру"
  end

  def flash_helper(flash)

      safe_join(
        flash.map do |key, value|
          tag.div value.html_safe, class: "alert alert-#{key}"
        end
        )
    end


end
