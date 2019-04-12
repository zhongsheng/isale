module Isale
  class Contry < ApplicationRecord
    validates :name, presence: true
    has_many  :products
  end
end
