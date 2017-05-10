class Book < ApplicationRecord
  has_many :single_sorts
  has_many :lists, through: :single_sorts
end
