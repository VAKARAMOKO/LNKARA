class Student < ApplicationRecord

  #RELATIONS
  belongs_to :classroom
  has_many :student_scolars



  def new_scolar
    student_scolars.build
  end


  #STATISTIC
  def percent_complete
    return 0 if total_scolars == 0
    ((student_scolars.select(&:complete?).count.to_f / total_scolars) * 100).round
  end

  def percent_in_progress
    return 0 if total_scolars == 0
    ((student_scolars.select(&:in_progress?).count.to_f / total_scolars) * 100).round
  end

  def total_scolars
    student_scolars ||= student_scolars.count
  end

  #slug
  extend FriendlyId
    friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
end
