class Book
  include ActiveModel::Model
  include ActiveModel::Serialization
  include ActiveModel::Validations::Callbacks

  attr_accessor(
    :chansons,
    :name,
    :path,
  )

  FILENAME = "book.pdf"

  def add_chanson(titre)
    self.chansons ||= []
    chanson = Chanson.new(titre: titre)
    self.chansons << chanson
  end

  def html
    @html = chansons.map(&:html).join
  end

  def pdf
    kit.to_pdf
  end

  def find_titles!
    files = Dir.new(path).select{|file| !File.directory? file}
    files.each {|file| add_chanson(file) }

    self
  end

  def save!
    return false unless valid?

    kit.to_file(path)
  end

  private

  def kit
    @kit ||= PDFKit.new(html, :page_size => 'Letter')
  end
end