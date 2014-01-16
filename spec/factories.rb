FactoryGirl.define do
  factory :user do
    sequence(:sc_user_name) { |n| "sc_user_name_#{n}" }
    sequence(:sc_user_id)   { |n| "sc_user_id_#{n}" }
  
    factory :admin do
      admin true
    end
  end
  
  factory :micropost do
    content "Help me finish this song."
    link "https://soundcloud.com/dave_torre/novtwo-111311"
    user
  end
end