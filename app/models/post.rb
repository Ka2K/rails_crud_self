class Post < ActiveRecord::Base
  belongs_to :user # user.rb의 has_many :posts와 연관
end
