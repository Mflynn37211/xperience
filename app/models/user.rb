class User < ActiveRecord::Base
  has_many :experiences
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :username, uniqueness: true
  validates :username, presence: true, length: { in: (6..32) }
end
