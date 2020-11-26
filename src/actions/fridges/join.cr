class Fridges::Join < BrowserAction
  post "/fridges/:id/join" do
    user = current_user
    fridge = FridgeQuery.find(id)
    JoinFridge.create!(user_id: user.id, fridge_id: fridge.id)
    flash.info = "Thanks for joining #{fridge.name}"
    redirect to: Fridges::Show.with(id: id)
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
