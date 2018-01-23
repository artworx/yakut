module Yakut
  class Base64Filter
    include Crinja::Callable

    getter name = "base64"

    getter defaults = {} of String => Crinja::Type

    def call(arguments)
      Base64.encode(arguments.target.to_s)
    end
  end
end
