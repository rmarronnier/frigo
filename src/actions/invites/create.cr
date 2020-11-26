class Invites::Create < BrowserAction
  post "/fridges/:id/invites" do
    fridge = FridgeQuery.find(id)
    SaveInvite.create(params, fridge_id: fridge.id) do |operation, invite|
      if invite
        # fridge.invites = [invite.email] if fridge.invites.nil?
        # SaveFridge.update!(fridge)
        flash.info = "Thanks for creating an invite"
        redirect to: Fridges::Show.with(id: id)
      else
        flash.info = "Couldn't create an invite"
        html NewPage, operation: operation, associated_fridge: fridge
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
