class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait_validation

    CLICKBAIT = [
        /Won't Believe/,
        /Secret/,
        /Top [0-100]/,
        /Guess/
    ]

    def clickbait_validation
        if CLICKBAIT.none?{|arr| arr.match title }
            errors.add(:title, "must be clickbait")
        end
    end
end
