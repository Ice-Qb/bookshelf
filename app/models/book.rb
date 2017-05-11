require 'prime'

class Book < ApplicationRecord
  include PgSearch

  multisearchable against: %i[name genres authors publisher], if: :available?

  has_many :single_sorts
  has_many :lists, through: :single_sorts

  def name_length_prime?
    Prime.prime? name.length
  end

  def self.prime_length_name_books
    ids = all.map { |book| book.id if book.name_length_prime? }.compact
    where(id: ids)
  end

  def self.top_discount_books(number)
    includes(:lists, :single_sorts).
      references(:single_sorts).
      where('lists.name = ?', 'discount').
      order('single_sorts.position DESC').
      limit(number)
  end
end
