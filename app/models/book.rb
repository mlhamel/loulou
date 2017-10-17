class Book
  include ActiveModel::Model
  include ActiveModel::Serialization
  include ActiveModel::Validations::Callbacks

  attr_accessor(
    :chansons,
    :path,
  )

  def initialize(titres, attributes = {})
    super(attributes)

    titres.each do |titre|
      add_chanson(titre)
    end
  end

  def add_chanson(name)
    chanson = Chanson.new(name: name)
    self.chansons << chanson
  end

  def html
    @html = chansons.map(&:html)
  end

  def pdf
    kit.to_pdf
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