class Promo < ApplicationRecord

  #RELATIONS
  belongs_to :user
  has_many :classrooms, dependent: :destroy


  #slug
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
      title_changed?
  end
end
