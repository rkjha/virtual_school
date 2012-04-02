class Question < ActiveRecord::Base
	#acts_as_commentable
	#opinio_subjectum
	attr_accessible :title, :desc
    validates :user_id, presence: true
    validates :title, presence: true

    belongs_to :user
    has_many :answers
    
end
