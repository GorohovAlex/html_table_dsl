require_relative 'col'
require_relative 'tag'

module Html
  class Row < Tag
    attr_reader :cols

    def initialize(cols = Array.new(0, Col.new), **attrs)
      super(**attrs)

      @cols = cols
    end

    private

    def tag_name
      :tr
    end

    def value
      @cols&.map(&:to_s)&.join
    end
  end
end
