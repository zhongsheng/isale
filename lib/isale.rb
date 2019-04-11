require "isale/engine"

module Isale
  # Your code goes here...

  IsaleUser = Struct.new(:name) do
    def present?
      true
    end
  end

  module ApplicationHelper

  end

end
