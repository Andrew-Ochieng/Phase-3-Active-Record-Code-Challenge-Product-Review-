class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
        Review.create(star_rating: star_rating, comment: comment, user_id: user.id, product_id: self.id)
    end

    def self.print_all_reviews
      puts revies.map do |review| 
        "Review for #{review.product.name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
      end
    end

    def self.average_rating
        reviews.average(:star_rating).to_f
    end
end