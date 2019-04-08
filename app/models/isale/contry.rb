module Isale
  class Contry < ApplicationRecord
    validates :name, presence: true
  end
end
