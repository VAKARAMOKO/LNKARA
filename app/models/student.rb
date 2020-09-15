class Student < ApplicationRecord

  #RELATIONS
  belongs_to :classroom
  has_many :scolars

  def new_scolar
    scolars.build
  end



  #slug
  extend FriendlyId
    friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
end
