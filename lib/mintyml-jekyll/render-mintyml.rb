module Jekyll
  class RenderMintyml < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      @args = markup.split(' to ').map { |s| s.strip }
    end

    def render(context)
      converter = context.registers[:site].find_converter_instance(Jekyll::MintymlConverter)
      converter.convert(super)
    end
  end
end

Liquid::Template.register_tag('render_mintyml', Jekyll::RenderMintyml)
