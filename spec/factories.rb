FactoryGirl.define do 
factory :user, class: User do
   sequence(:email) { |n| "foo#{n}@example.com" }
   sequence(:username) { |n| "fooff#{n}" }
   sequence(:first_name) { |n| "FFoo#{n}le" }
   sequence(:last_name) { |n| "FFoo#{n}@exam" }
   password "secret" 
   password_confirmation "secret"
end
end
