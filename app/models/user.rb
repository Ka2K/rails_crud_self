class User < ActiveRecord::Base
  has_secure_password #bcrypt gem이 bcrypt로 된 password를 받으려고 하는구나라고 인식한다?
  has_many :posts # post.rb의 blongs_to :user와 연결
end
