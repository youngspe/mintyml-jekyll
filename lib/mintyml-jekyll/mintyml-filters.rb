module Jekyll; module MintymlFilters

  # Escapes any characters with special meaning in MinTyML
  #
  # input - The String to escape.
  #
  # Returns the escaped String.
  def mintyml_escape(input)
    return input unless input
    input.to_s.gsub(/[<>{}\[\]"']/, '\\\\\0')
  end
end; end

Liquid::Template.register_filter(Jekyll::MintymlFilters)
