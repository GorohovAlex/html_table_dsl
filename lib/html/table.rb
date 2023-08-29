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
      super(**attrs)

      @head_rows = Row.new(Array.new(0))
      @body_rows = Array.new(rows, Row.new(Array.new(cols, Col.new)))
    end

    def write_row(index, row)
      @body_rows[index] = row
    end

    def write_header(head_rows)
      @head_rows = head_rows
    end

    private

    def tag_name
      :table
    end

    def value
      output_value = ''
      output_value += head.to_s unless head.empty?
      output_value + body.to_s unless body.empty?
    end

    def head
      @head ||= Thead.new(@head_rows)
    end

    def body
      @body ||= Tbody.new(@body_rows)
    end
  end
end
