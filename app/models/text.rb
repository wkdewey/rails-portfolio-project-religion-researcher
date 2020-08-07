class Text < ApplicationRecord
  has_many :notes
  belongs_to :author
  has_many :projects, through: :notes
  validates :title, presence: true
  accepts_nested_attributes_for :author
  accepts_nested_attributes_for :notes
end
