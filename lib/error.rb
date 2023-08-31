class ChildFormatError < StandardError
  def initialize(allowed_classes)
    message = "The child must be an Html class on of: #{allowed_classes.join(', ')}"
    super(message)
  end
end
