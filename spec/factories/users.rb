FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { 'aa0000' }
    password_confirmation { password }
    family_name           { 'あア木' }
    first_name            { 'あア木' }
    family_name_kana      { 'キ' }
    first_name_kana       { 'キ' }
    birthdays             { '1930-3-13' }
  end
end
