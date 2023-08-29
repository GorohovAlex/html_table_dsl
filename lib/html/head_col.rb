require_relative 'col'

module Html
  class HeadCol < Col
    private

    def tag_name
      :th
    end
  end
end
