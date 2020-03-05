require "factory_bot"

FactoryBot.define do
  factory :user do
    id { "1" }
    first_name { "Jorge" }
    last_name { "Vargas" }
    password { "vargas" }
    description { "description" }
    email { "jvargas18@ucol.mx" }
  end
end
