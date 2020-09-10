class Classroom < ApplicationRecord
  belongs_to :promo

  def elements
    students
  end
end
