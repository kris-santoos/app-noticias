class SavedNews < ApplicationRecord

    validates :title, presence: true
    validates :url, presence: true, uniqueness: { scope: :user_id}

    belongs_to :user
    
end
