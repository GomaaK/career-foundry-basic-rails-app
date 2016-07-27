FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }	
	factory :user, class: User do
		email 
    password "123123123"
    first_name "George"
    last_name "Bullock"
    admin false
  end 
end