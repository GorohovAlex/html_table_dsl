require_relative 'tag'
module Html
  class Tbody < Tag
    def initialize(rows = Row.new(Array.new(0)), **attrs)
      super(**attrs)

      @rows = rows
    end

    def empty?
      @rows.nil? || @rows.empty?
    end

    private

    def tag_name
      :tbody
    end

    def value
      @rows&.map(&:to_s)&.join
    end
  end
end
