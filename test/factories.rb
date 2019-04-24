FactoryBot.define do
 
  factory :employee do
    first_name { "Ed" }
    last_name { "Gruberman" }
    ssn { rand(9 ** 9).to_s.rjust(9,'0') }
    date_of_birth { 19.years.ago.to_date }
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    role { "employee" }
    active { true }
  end
  
  factory :store do
    name {"CMU"}
    street {"5000 Forbes Avenue"}
    city {"Pittsburgh"}
    state {"PA"}
    zip {"15213"}
    phone { rand(10 ** 10).to_s.rjust(10,'0') }
    active {true}
  end
  
  factory :assignment do
    association :store
    association :employee
    start_date {1.year.ago.to_date}
    end_date { nil }
    pay_level {1}
  end
  
  factory :flavor do
    name { "Strawberry" }
    active { true }
  end
  
  factory :store_flavor do
    association :flavor
    association :store
  end
  
  factory :shift do
    association :assignment
    date { 10.days.from_now }
    start_time { Time.now - 2.hours }
    end_time { Time.now + 15.hours }
    notes { "The shift went well - all the chores were 
    completed and the employee worked hard" }
  end
  
  factory :job do
    name { "Mopping the Floors" }
    description { "Throughout the store" }
    active { true }
  end
  
  factory :shift_job do
    association :job
    association :shift
  end
  
  factory :user do
    association :employee
    email { "testemail@test.com" }
    password_digest { "testpassword" }
  end
end
