class Post < ApplicationRecord
 validates :title, presence: true
 validates :content, length: { minimum: 250}
 validates :summary, length: { maximum: 250}
 validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

 validate :clickbait_title
 TITLE_NOT_CONTAIN = [
     /Won't Believe/i,
     /Secret/i,
     /Top/i,
     /Guess/i

 ] 

 def clickbait_title
    if TITLE_NOT_CONTAIN.none? {|word| word.match title}
     errors.add(:title, "Invalid title")
    end
 end
end