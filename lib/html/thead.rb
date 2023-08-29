require_relative 'tag'

module Html
  class Thead < Tag
    def initialize(row = Row.new(Array.new(0)), **attrs)
      super(**attrs)

      @row = row
    end

    def empty?
      @row.nil? || @row.cols.empty?
    end

    private

    def tag_name
      :thead
    end

    def value
      @row
    end
  end
end
