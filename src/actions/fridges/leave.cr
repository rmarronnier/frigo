class Fridges::Leave < BrowserAction
  post "/fridges/:id/leave" do
    fridge = FridgeQuery.find(id)
    PairingQuery.new.user_id(current_user.id).fridge_id(id).first.delete
    flash.info = "You successfully left #{fridge.name}"
    redirect to: Fridges::ShowAll
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
