class JoinFridge < Pairing::SaveOperation
  # Run validations and yields the operation and the user if valid

  # needs fridge : Fridge
  # needs user_email : String

  # def create(user : User, fridge : Fridge)
  #   validate_if_invited(user, fridge)

  #   if valid?
  #     yield user, fridge
  #   else
  #     yield user, nil
  #   end
  # end

  before_save validate_if_invited

  after_save remove_invite

  private def remove_invite(pairing : Pairing)
    user_email = UserQuery.find(pairing.user_id).email
    InviteQuery.new.email(user_email).fridge_id(pairing.fridge_id).first.delete
  end

  private def validate_if_invited
    # user_email = UserQuery.find(user_id).email
    # fridge_id.add_error "You are not invited to this fridge." if InviteQuery.new.email(user_email).fridge_id(fridge_id).first?.nil?
  end
end
