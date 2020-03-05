FactoryBot.define do
  factory :list do
    id { "1" }
    name { "Super" }
    description { "super list" }
    association :user
  end
end
