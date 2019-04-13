module Isale
  class Product < ApplicationRecord
    default_scope { where(hidden: false) }
    # default_scope { where(published: true) }
    default_scope { order(:id) }
    has_rich_text :content
    belongs_to :category
    belongs_to :contry
    belongs_to :supplier
    has_many   :product_tags
    has_many   :tags, through: :product_tags

    include ActionView::Helpers::AssetTagHelper

    before_save do |product|
      if not product.content.blank?
        if /src="(.*)"/.match(product.content.to_s)
          product.photo = $1
          pp product.photo
        end
      end
    end
    after_find do |product|
      if product.photo.blank?
        product.photo = 'http://tmp.dzunion.cn/logo.png'
      end
    end

    def photo_thumb
      image_tag(self.photo + '/thumb')
    end

    def self.hiddened
      self.unscoped.where({hidden: true})
    end

    def self.restore(id)
      self.unscoped.find(id).update({hidden: false})
    end

    def destroy
      self.update({hidden: true})
    end
  end
end
