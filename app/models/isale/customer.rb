module Isale
  class Customer < ApplicationRecord
    has_rich_text :content
  end
end
