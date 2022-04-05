class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction'] }

    validate :clickbaity
    
    def clickbaity
        if title
            unless title.match?(/Won't Believe|Secret|Top \d+|Guess/i)
                errors.add(:title, "That title just doesn't have the clicks")
            end
        end
    end
end
