class Todo < ApplicationRecord
  def completed?
    !completed_at.blank?
  end
end
