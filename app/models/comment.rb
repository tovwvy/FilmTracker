class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :film

  validates :content, presence: true

  validates :user_id, presence: true

  #This method checks if the passed in user is the same as the user who created the comment.
  def editable_by?(user)
    user == self.user
  end

  
end
