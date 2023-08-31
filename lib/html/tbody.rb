require_relative 'tag'
require_relative 'row'
module Html
  class Tbody < Tag
    ALLOWED_CHILDREN = [Html::Row].freeze

    private

    def tag_name
      :tbody
    end
  end
end
