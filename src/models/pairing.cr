class Pairing < BaseModel
  table do
    belongs_to user : User
    belongs_to fridge : Fridge
  end
end
