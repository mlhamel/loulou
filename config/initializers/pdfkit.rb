# config/initializers/pdfkit.rb
PDFKit.configure do |config|
  config.default_options = {
    :page_size => 'Letter',
    :print_media_type => true
  }
  config.verbose = true
end