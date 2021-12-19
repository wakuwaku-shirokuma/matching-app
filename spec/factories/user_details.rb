FactoryBot.define do
  factory :user_detail do
    future { '目指すもの１' }
    #user { create(:user) }
    association :user
    # inquiry_mail { create(:inquiry_mail) }
    # association :inquiry_mail
  end
end
