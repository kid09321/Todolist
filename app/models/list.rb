class List < ActiveRecord::Base
  belongs_to :work
  validates :thing, presence: true
  def to_completed!
    update_columns(is_complete: true)
  end
  def to_incomplete!
    update_columns(is_complete: false)
  end
end

