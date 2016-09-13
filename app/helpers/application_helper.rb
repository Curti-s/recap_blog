module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code,language)
      Pygments.highlight(code,lexer: language)
    end
  end
  def markdown(content)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = HTMLwithPygments.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(content).html_safe
  end
end
