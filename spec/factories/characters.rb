FactoryGirl.define do
  factory :character do
    characterId 1
    name "MyString"
    level 1
    experience 1
    health 1
    discount 1
    isDead false
    currentRoom 1
  end
end
