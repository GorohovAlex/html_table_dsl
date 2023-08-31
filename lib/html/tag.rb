require './lib/error'

module Html
  class Tag
    ALLOWED_CHILDREN = [].freeze
    attr_reader :value

    def initialize(value = nil, **attrs)
      @attributes = attrs
      @value = value
      valid_children?
    end

    def to_s
      "<#{tag_name}#{read_attributes}>#{read_value}</#{tag_name}>"
    end

    def attributes=(new_attributes)
      @attributes.merge!(new_attributes).compact!
    end

    def tag_name
      nil
    end

    def empty?
      return value.all?(&:empty?) if value.is_a?(Array)

      value.nil? ? true : value&.empty?
    end

    private

    def read_value
      value.is_a?(Array) ? value.map(&:to_s).join : value
    end

    def read_attributes
      attributes.empty? ? nil : " #{attributes}"
    end

    def attributes
      @attributes.map { |key, value| "#{CGI.escapeHTML(key.to_s)}='#{CGI.escapeHTML(value)}'" }.join(' ')
    end

    def valid_children?
      return true if @value.is_a?(String) || @value.nil?

      all_allowed = @value&.all? { |value| self.class::ALLOWED_CHILDREN.include?(value.class) }
      raise ChildFormatError, self.class::ALLOWED_CHILDREN unless all_allowed
    end
  end
end
