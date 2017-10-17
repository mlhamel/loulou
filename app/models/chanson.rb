class Chanson
  include ActiveModel::Model

  attr_accessor(
    :titre,
    :path,
    :content,
    :html,
  )

  def content
    @content ||= File.read(path)
  end

  def path
    @path ||= File.join(Rails.application.config.chanson_path, titre)
  end

  def html
    return unless content

    @html ||= markdown_renderer.render(content)
  end

  private

  def markdown_renderer
    @markdown_renderer ||= begin
      Redcarpet::Markdown.new(
        Redcarpet::Render::HTML.new(
          no_links: true,
          hard_wrap: true,
          prettify: true,
        )
      )
    end
  end
end