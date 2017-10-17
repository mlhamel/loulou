class BookBuilder < Operation
  property :titres, required: true
  property :name, required: true
  property :path, required: true

  def perform
    Book
      .new(titres, name: name, path: path)
      .print
      .save!
    end
  end
end
