FactoryBot.define do
  factory :user do
    name {'Admin'}
    sequence(:email) {|n| "admin#{n}@email.com"}
    sequence(:company_name) {|n| "company_#{n}"}
    password {'password'}
    password_confirmation {'password'}
    cnpj {'73.051.233/0001-97'}
  end
end
