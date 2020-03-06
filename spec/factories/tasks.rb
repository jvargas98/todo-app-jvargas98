FactoryBot.define do
  factory :task do
    id { "1" }
    name { "Hacer un crud" }
    text { "un crud en rails" }
    association :list
  end
end
