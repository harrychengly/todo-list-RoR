class Listing < ApplicationRecord
    validates :category, presence:true
    validates :body, presence:true
end
