class Parent < ActiveRecord::Base
  has_many :children

  validates :name, presence: true, uniqueness: true
end
