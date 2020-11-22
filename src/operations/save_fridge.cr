class SaveFridge < Fridge::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/validating-saving#perma-permitting-columns
  #
  # needs current_user : User

  param_key :fridge
  permit_columns name

  # after_save set_first_user

  # def set_first_user(new_fridge : Fridge)
  #    user = current_user
  #    user.fridges! << new_fridge
  #   SaveUser.update!(user)
  #   SaveUser.update!(user)
  #   new_fridge.users! << current_user
  # end
end
