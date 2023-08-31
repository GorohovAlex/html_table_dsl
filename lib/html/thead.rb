require_relative 'tag'
require_relative 'row'

module Html
  class Thead < Tag
    ALLOWED_CHILDREN = [Html::Row].freeze

    private

    def tag_name
      :thead
    end
  end
end
