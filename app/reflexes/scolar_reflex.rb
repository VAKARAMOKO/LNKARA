# frozen_string_literal: true

class ScolarReflex < ApplicationReflex

  def change_status
      scolar = ScolarItem.includes(:student).find(element.dataset.id)
      scolar.update(status: element.dataset.status)
      morph "#checklist-#{scolar.student_id}", ApplicationController.render(
        partial: 'students/student',
        locals: { student: scolar.student }
      )
    end


end
