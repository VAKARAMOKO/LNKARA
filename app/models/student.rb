class Student < ApplicationRecord
  belongs_to :classroom
  has_many :students


  def percent_complete
    return 0 if total_items == 0
    ((student_invoices.select(&:complete?).count.to_f / total_items) * 100).round
  end

  def percent_in_progress
    return 0 if total_items == 0
    ((student_invoices.select(&:in_progress?).count.to_f / total_items) * 100).round
  end

  def total_items
    @total_items ||= student_invoices.count
  end

  #SLUG
  extend FriendlyId
    friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
      name_changed?
  end
end


