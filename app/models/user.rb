class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def email_required?
    false
  end

  def email_changed?
    false
  end

  # use this instead of email_changed? for Rails = 5.1.x
  def will_save_change_to_email?
    false
  end


#VALIDATIONS
validates :email, uniqueness: true
validates :code_school, presence: true
validates :contact, uniqueness: true


#RELATIONS
has_many :promos



#slug
  extend FriendlyId
    friendly_id :username, use: :slugged

  def should_generate_new_friendly_id?
      username_changed?
  end

end
