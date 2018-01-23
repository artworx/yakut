module Yakut
  class GetImageFilter
    include Crinja::Callable

    getter name = "image_version"

    getter defaults = {
      "deployment" => nil,
      "container" => 0
    } of String => Crinja::Type

    def call(arguments)
      `kubectl get deployment #{arguments[:deployment]} -o=jsonpath='{$.spec.template.spec.containers[#{arguments[:container]}].image}'`
    end
  end
end
