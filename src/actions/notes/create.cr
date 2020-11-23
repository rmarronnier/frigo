class Notes::Create < BrowserAction
  post "/fridges/:id/notes" do
    fridge = FridgeQuery.find(id)
    SaveNote.create(params, fridge_id: fridge.id, user_id: current_user.id) do |operation, note|
      if note
        # SaveNote.update!(note)
        SaveSticking.create!(fridge_id: fridge.id, note_id: note.id, user_id: current_user.id)
        # SaveUser.update!(user, params)
        flash.info = "Thanks for creating a note"
        redirect to: Fridges::Show.with(id: id)
      else
        flash.info = "Couldn't create a note"
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
