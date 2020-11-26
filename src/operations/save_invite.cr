class SaveInvite < Invite::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/validating-saving#perma-permitting-columns
  #
  permit_columns email
  # needs fridge_id : Int64

  # before_save adds_fridge_id

  # def adds_fridge_id
  #   fridges.value = [] of Int64 if fridges.value.nil?
  #   fridges.value.not_nil! << @fridge_id
  # end

  before_save validate_invite

  private def validate_invite
    email.add_error "#{email.value} is already invited." unless InviteQuery.new.email(email.value.not_nil!).fridge_id(fridge_id.value.not_nil!).first?.nil?
    FridgeQuery.find(fridge_id.value.not_nil!).users!.each do |user|
      email.add_error "#{email.value} is already part of this fridge." if user.email == email.value.not_nil!
    end
  end
end
