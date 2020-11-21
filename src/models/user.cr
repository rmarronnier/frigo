class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table do
    column name : String?
    column email : String
    column encrypted_password : String
    has_one fridge : Fridge?
    has_many notes : Note?
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end
end
