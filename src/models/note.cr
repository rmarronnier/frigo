class Note < BaseModel
  table do
    column content : JSON::Any
    belongs_to fridge : Fridge
    belongs_to user : User
  end
end
