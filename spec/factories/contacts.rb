FactoryBot.define do

  sequence :name do |n|
    "Fred Bloggs #{n}#{n}"
  end

  sequence :number do |n|
    "#{n}#{n+1}#{n+2}#{n+3}#{n+6}#{n+5}#{n+4}"
  end

  factory :contact do
    name { generate(:name) }
    number { generate(:number) }
  end

end
