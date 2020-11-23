class Note < BaseModel
  table do
    column content : String
    belongs_to fridge : Fridge
    belongs_to user : User
    has_many stickings : Sticking # this is a hack, should be has_one but fails with it
  end
end
