require "isale/engine"

module Isale
  # Your code goes here...

  IsaleUser = Struct.new(:name) do
    def present?
      true
    end
  end

  module ApplicationHelper
    def current_user
      return IsaleUser.new('admin')
    end
  end

end
