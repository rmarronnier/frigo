class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table do
    column name : String?
    column email : String
    column encrypted_password : String
    has_many pairings : Pairing
    has_many stickings : Sticking
    has_many fridges : Fridge?, through: :pairings
    has_many notes : Note?, through: :stickings
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end

  def invites
    InviteQuery.new.email(email)
  end
end
