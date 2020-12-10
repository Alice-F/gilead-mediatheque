FactoryBot.define do
  factory :user do
    first_name { 'Alice' }
    last_name { 'Fabre' }
    email { 'alice.fabre@hotmail.fr' }
    password { 'plopplop' }
  end
end
