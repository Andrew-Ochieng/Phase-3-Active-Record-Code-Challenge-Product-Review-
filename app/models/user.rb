class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        favorite_product_id = Review.find_by(star_rating: reviews.maximum(:star_rating)).product_id
        Product.find(favorite_product_id)
    end

    def remove_reviews(product)
        reviews.where(product_id: product.id).destroy_all
    end
end