require_relative 'col'
require_relative 'head_col'
require_relative 'tag'

module Html
  class Row < Tag
    ALLOWED_CHILDREN = [Html::Col, Html::HeadCol].freeze

    private

    def tag_name
      :tr
    end
  end
end
