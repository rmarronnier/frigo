class Fridge < BaseModel
  table do
    column name : String
    has_many users : User
    has_many notes : Note
  end
end
