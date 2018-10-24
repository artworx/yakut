require "crinja"
require "./yakut/*"

struct Crinja::Finalizer
  protected def stringify(raw : Nil)
    @io << ""
  end
end

# TODO: Write documentation for `Yakut`
module Yakut
  # TODO: Put your code here
end
