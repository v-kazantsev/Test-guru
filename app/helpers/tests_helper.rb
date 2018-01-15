module TestsHelper

def year
  Time.now.year
end

def github_url(author, repo)
  "https://github.com/" + "#{author}" +"/" + "#{repo}"
end

def school_url
  "http://thinknetica.com"
end


end
