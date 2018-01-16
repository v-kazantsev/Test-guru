module TestsHelper

def year
  Time.current.year
end

def github_url(author, repo)
  "<a href='https://github.com/#{author}/#{repo}' target='blank'>Проект Тест Гуру</a>".html_safe
end

end
