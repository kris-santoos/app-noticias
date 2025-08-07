class SavedNews < ApplicationRecord

    validates :title, presence: true
    validates :description, presence: true
    validates :url, presence: true, uniqueness: { scope: :user_id}
    validates :source, presence: true

    belongs_to :user
    
end
