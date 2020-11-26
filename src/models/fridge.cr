class Fridge < BaseModel
  table do
    column name : String
    has_many invites : Invite
    has_many pairings : Pairing
    has_many stickings : Sticking
    has_many users : User, through: :pairings
    has_many notes : Note, through: :stickings
  end
end
