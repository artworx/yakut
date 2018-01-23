module Yakut
  class FileList
    class TemplateFile
      getter full_path : String

      def initialize(@templates_dir : String, @full_path)
      end

      def dirname
        File.dirname(relative_path)
      end

      def relative_path
        @full_path.gsub(/#{@templates_dir}/, "")
      end
    end

    def initialize(@templates_dir : String)
    end

    def files
      Dir.glob("#{@templates_dir}/**/*.y*ml").map do |file|
        TemplateFile.new(@templates_dir, file)
      end
    end
  end
end
