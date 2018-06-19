module Yakut
  class Base64Filter
    include Crinja::Callable

    getter name = "base64"
    getter defaults : Crinja::Variables = Crinja.variables({} of String => String)

    def call(arguments)
      Base64.encode(arguments.target.to_s)
    end
  end
end
