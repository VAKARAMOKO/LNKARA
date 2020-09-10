class Promo < ApplicationRecord
  belongs_to :user
  has_many :classrooms, dependent: :destroy
end
