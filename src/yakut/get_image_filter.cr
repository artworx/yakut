module Yakut
  class GetImageFilter
    include Crinja::Callable

    getter name = "image_version"

    getter defaults : Crinja::Variables = Crinja.variables({
      "deployment" => nil,
      "container" => 0
    })

    def call(arguments)
      `kubectl get deployment #{arguments[:deployment]} -o=jsonpath='{$.spec.template.spec.containers[#{arguments[:container]}].image}'`
    end
  end
end
