require_relative 'operation'
require_relative '../models/book'
require_relative '../models/chanson'

class BookBuilder < Operation
  property :name, required: true
  property :path, required: true

  def perform
    Book
      .new(name: name, path: path)
      .find_titles!
      .save!
  end
end
