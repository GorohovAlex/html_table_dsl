require 'cgi'
require_relative 'tag'

module Html
  class Col < Tag
    def initialize(value = '', **attrs)
      super(**attrs)

      @value = value
    end

    private

    def tag_name
      :td
    end

    def value
      CGI.escapeHTML(@value.to_s)
    end
  end
end
