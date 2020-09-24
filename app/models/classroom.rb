class Classroom < ApplicationRecord
  #RELATIONS
  belongs_to :promo
  has_many :students, dependent: :destroy

  #student_features
  def elements
    students
  end

  #slug
  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
      title_changed?
  end
end
