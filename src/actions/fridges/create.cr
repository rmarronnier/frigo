class Fridges::Create < BrowserAction
  post "/fridges" do
    SaveFridge.create(params) do |operation, fridge|
      if fridge
        SaveFridge.update!(fridge)
        SavePairing.create!(fridge_id: fridge.id, user_id: current_user.id)
        # SaveUser.update!(user, params)
        flash.info = "Thanks for creating a fridge"
        redirect to: Home::Index
      else
        flash.info = "Couldn't create a fridge"
        html NewPage, operation: operation
      end
    end
  end
end

#   post "/fridges" do
#     SaveFridge.create(params) do |operation, fridge|
#       if fridge # the fridge was saved
#         html Fridges::ShowPage, fridge: fridge
#       else
#         html Fridges::NewPage, save_fridge: operation
#       end
#     end
#   end
# end
