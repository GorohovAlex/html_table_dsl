require_relative 'tag'
require_relative 'row'
require_relative 'thead'
require_relative 'tbody'

module Html
  def self.table(rows_number, cols_number, **attrs)
    Table.new(rows_number, cols_number, **attrs)
  end

  class Table < Tag
    def initialize(rows = 0, cols = 0, **attrs)
      @head_rows = []
      @body_rows = Array.new(rows, Row.new(Array.new(cols, Col.new(' '))))

      super(**attrs)
    end

    def write_row(index, row)
      @body_rows[index] = row
    end

    def write_header(head_rows)
      @head_rows = head_rows
    end

    def value
      output_value = ''
      output_value += head.to_s unless head.empty?
      output_value + body.to_s unless body.empty?
    end

    private

    def tag_name
      :table
    end

    def head
      @head ||= Thead.new(@head_rows)
    end

    def body
      @body ||= Tbody.new(@body_rows)
    end
  end
end
