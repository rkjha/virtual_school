class Question < ActiveRecord::Base
	#acts_as_commentable
	#opinio_subjectum
	acts_as_indexed :fields => [:title, :desc]
	attr_accessible :title, :desc
    validates :user_id, presence: true
    validates :title, presence: true

    belongs_to :user
    has_many :answers
    
end
