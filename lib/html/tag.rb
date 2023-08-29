require 'cgi'

module Html
  class Tag
    def initialize(**attrs)
      @attributes = attrs
    end

    def to_s
      "<#{tag_name}#{read_attributes}>#{value}</#{tag_name}>"
    end

    def attributes=(new_attributes)
      @attributes.merge!(new_attributes).compact!
    end

    private

    def tag_name
      raise NotImplementedError
    end

    def value
      raise NotImplementedError
    end

    def read_attributes
      attributes.empty? ? nil : " #{attributes}"
    end

    def attributes
      @attributes.map { |key, value| "#{CGI.escapeHTML(key.to_s)}='#{CGI.escapeHTML(value)}'" }.join(' ')
    end
  end
end
