class Work < ActiveRecord::Base
  has_many :lists
  belongs_to :user
  validates :title, presence: true
  def to_completed!
    update_columns(is_complete: true)
  end

  def to_incomplete!
    update_columns(is_complete: false)
  end
end
