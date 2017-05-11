class Article < ApplicationRecord
  include PgSearch

  multisearchable against: %i[name genres authors]
end
