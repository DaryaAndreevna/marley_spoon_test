module Entries
  class Photo < Base
    fields :file

    SIZES = %i[thumb medium].freeze

    def url(size = nil)
      case size
      when :thumb then version(300)
      when :medium then version(500)
      else origin_url
      end
    end

    private

    def version(width)
      "#{origin_url}?#{{ w: width }.to_query}"
    end

    def origin_url
      @origin_url ||= "https:#{file.url}"
    end
  end
end
