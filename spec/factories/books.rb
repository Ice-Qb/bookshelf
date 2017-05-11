FactoryGirl.define do
  factory :book do
    name 'The Master and Margarita'
    available false
    genres 'Mysticism'
    authors 'Mikhail Bulgakov'
    publisher 'YMCA Press'
    factory :prime_book do
      name 'Faust'
    end
  end
end
