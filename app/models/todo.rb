class Todo < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :task
    validates :time
  end
end
