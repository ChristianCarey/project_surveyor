FactoryGirl.define do
  factory :question do
    prompt "MyString"
    required false
    selection_type_id 1
    survey nil
  end
end
