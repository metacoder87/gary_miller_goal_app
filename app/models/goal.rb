class Goal < ApplicationRecord
    include Commentable

    validates :title, presence: true, length: { minimum: 6 }

    belongs_to :author,
        class_name: :User,
        foreign_key: :user_id

    has_many :cheers

    def cheered_by?(user)
        cheers.exists?(giver_id: user.id)
    end

end
