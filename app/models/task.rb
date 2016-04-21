class Task < ActiveRecord::Base
  has_many :battles

  validates :title, presence: true


end
