FactoryGirl.define do
  factory :wiki do
    title Faker::Hipster.words(3)
    body Faker::Hipster.paragraph
    private false
    user
  end

  factory :private_wiki do
    title Faker::Hipster.sentence(3)
    body Faker::Hipster.paragraph
    private true
    user
  end

end
