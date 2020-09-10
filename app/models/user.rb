class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#RELATIONS
has_many :promos



#slug
  extend FriendlyId
    friendly_id :username, use: :slugged

  def should_generate_new_friendly_id?
      username_changed?
  end

end
