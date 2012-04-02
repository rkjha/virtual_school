class Answer < ActiveRecord::Base
	attr_accessible :ans
    validates :question_id, presence: true
    validates :user_id, presence: true

    belongs_to :question
    belongs_to :answer
end
