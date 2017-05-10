require 'prime'

class Book < ApplicationRecord
  has_many :single_sorts
  has_many :lists, through: :single_sorts

  def name_length_prime?
    Prime.prime? name.length
  end
end
