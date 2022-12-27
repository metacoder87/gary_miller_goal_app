class Goal < ApplicationRecord
    validates :title, presence: true, length: { minimum: 6 }

    belongs_to :author,
        class_name: :User,
        foreign_key: :user_id
end
