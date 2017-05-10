require 'prime'

class Book < ApplicationRecord
  has_many :single_sorts
  has_many :lists, through: :single_sorts

  def name_length_prime?
    Prime.prime? name.length
  end

  def self.prime_length_name_books
    ids = all.map { |book| book.id if book.name_length_prime? }.compact
    where(id: ids)
  end
end
