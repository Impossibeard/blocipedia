FactoryGirl.define do
  factory :user do
    username Faker::Name.last_name
    email Faker::Internet.safe_email
    password "password"
    password_confirmation "password"
    confirmed_at Time.now
  end

end
