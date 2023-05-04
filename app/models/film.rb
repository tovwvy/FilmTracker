class Film < ApplicationRecord
    validates :name, presence: true, uniqueness: {scope: :year}
    
    has_many :comments, dependent: :destroy

    before_destroy :delete_comments

    private

    def delete_comments
        self.comments.destroy_all
    end
end