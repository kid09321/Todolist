class Work < ActiveRecord::Base

  def to_completed!
    update_columns(is_complete: 1)
  end

  def to_incomplete!
    update_columns(is_complete: 0)
  end
end
