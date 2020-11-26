class Invite < BaseModel
  table do
    column email : String
    belongs_to fridge : Fridge
  end
end
