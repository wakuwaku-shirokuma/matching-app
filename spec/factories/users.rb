FactoryBot.define do
  factory :user do
    sequence(:id)
    name { 'abc' }
    gender { 1 }
    birth { nil }
    joined_date { nil }
    note { 'テキスト' } 
    created_at { Time.now() }
    updated_at { Time.now() }
    #lock_version
    email { 'abc@gmail.com' }
    tel { '080-5505-7408' }
  end
end
