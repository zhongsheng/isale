module Isale
  class Category < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true
    has_many :tags
    has_many :products
  end
end
