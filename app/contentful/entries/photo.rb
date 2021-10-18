module Entries
  class Photo < Base
    fields :file

    def url
      @url ||= "https:#{file.url}"
    end
  end
end
