module Isale
  class Address < ApplicationRecord
    belongs_to :customer
  end
end
