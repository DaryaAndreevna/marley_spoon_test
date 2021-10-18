module ApplicationHelper
  def contentful_image(url, params = {})
    "https:#{url}?#{params.to_query}"
  end
end
