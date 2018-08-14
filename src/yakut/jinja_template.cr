require "yaml"
module Yakut
  class Configuration
    class Mapping
      YAML.mapping(
        profiles: {
          type: Hash(String, YAML::Any)
        }
      )
    end

    @defines = {} of String => String

    def self.parse(config_file)
      Configuration.new Mapping.from_yaml(File.read(config_file))
    end

    def initialize(@config : Mapping)
    end

    def add_arguments(arguments : Array(String))
      arguments.each do  |value|
        value.split("=").tap do |values|
          @defines[values[0]] = values[1]
        end
      end
    end

    def values_for_profile(profile : String)
      {
        "profile_name" => profile,
        "build" => {
          "profile" => @config.profiles[profile].as_h
        }
      }
    end
  end

  class JinjaTemplate
    def initialize
      @env = Crinja.new
      @env.functions << Yakut::GetImageFilter.new
      @env.filters << Yakut::Base64Filter.new
    end

    def render(content : String, config : Hash(String, Hash(String, Hash(YAML::Any, YAML::Any)) | String))
      template = @env.from_string(content)
      template.render(config)
    end
  end
end
