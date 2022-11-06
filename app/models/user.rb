class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def self.favourite_product
        # self.products.maximum(:star_rating)
        reviews.order(:star_rating).last.product
    end

    def self.remove_reviews(product)
        # product.reviews.filter{|review| review.user_id==self.id}
        # .map{||review|review.destroy}
        reviews.where(product: product).destroy_all
    end
end