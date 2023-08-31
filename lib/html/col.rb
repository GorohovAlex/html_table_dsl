require 'cgi'
require_relative 'tag'

module Html
  class Col < Tag
    private

    def tag_name
      :td
    end
  end
end
