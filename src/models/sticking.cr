class Sticking < BaseModel
  table do
    belongs_to note : Note
    belongs_to fridge : Fridge
    belongs_to user : User
  end
end
