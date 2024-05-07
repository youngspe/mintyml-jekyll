require 'open3'

module Jekyll
  class MintymlConverter < Converter
    self.highlighter_prefix "<[raw##["
    self.highlighter_suffix "]##]>"
    @node_initialized = false

    def source_root
      return @source_root if @source_root
      @source_root = File.join(__dir__, '../../convert-mintyml')
    end

    def matches(ext)
      ext =~ /^\.(mty|minty|mintyml)$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      if !@node_initialized
        Open3.capture2(
          "npm install",
          chdir: source_root,
        )
        @node_initialized = true
      end
      out, err, status = Open3.capture3(
        "node .",
        stdin_data: content,
        chdir: source_root,
      )
      puts "mintyml: #{err}" if err.length > 0
      raise err if status != 0
      out
    end

  end

end
