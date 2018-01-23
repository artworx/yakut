require "colorize"

module Yakut
  class BatchCompiler
    @config : Hash(String, Hash(String, Hash(YAML::Type, YAML::Type)) | String)

    def initialize(@dist_dir : String, @config)
    end

    def run(listing)
      listing.files.each do |template|
        compile(template, @config)
      rescue e
        print "Error processing #{template.full_path}\n"
        raise e
      end
    end

    private def compile(template, config)
      print "#{"processing".colorize(:yellow)} #{template.full_path}\n"

      Dir.mkdir_p("#{@dist_dir}/#{template.dirname}")
      content = File.read(template.full_path)

      rendered = JinjaTemplate.new.render(content, config)
      File.write("#{@dist_dir}/#{template.relative_path}", rendered)

      print "#{"wrote".colorize(:green)} #{@dist_dir}/#{template.relative_path}\n"
    end
  end
end
