class Task < ApplicationRecord
  attr_accessor :pass
  enum status: { todo: 0, doing: 1, done: 2 }
  validates :title, presence: true
  validates :status, presence: true
  validates :deadline, presence: true
  # validate :deadline, :must_start_from_today

  # def must_start_from_today
  #   errors.add(:deadline, 'must start from today.') if deadline.present? && deadline < Date.current
  # end

  ransacker :status, formatter: proc {|v| statuses[v]} do |parent|
    parent.table[:status]
  end
  Task.ransack(status_eq: 'todo').result

end
