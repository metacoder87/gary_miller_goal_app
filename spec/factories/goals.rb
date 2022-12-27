FactoryBot.define do
  factory :goal do
    title { "MyString" }
    private { false }
    details { "MyText" }
    completed { false }
    user_id { 1 }
  end
end
