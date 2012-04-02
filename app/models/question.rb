class Question < ActiveRecord::Base
	attr_accessible :title, :desc
    validates :user_id, presence: true
    validates :title, presence: true, length: {maximum: 80}

    belongs_to :user
    has_many :answers
end
