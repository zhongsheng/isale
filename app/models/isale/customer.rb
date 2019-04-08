module Isale
  class Customer < ApplicationRecord
    has_rich_text :content
    has_many :addresses
  end
end
