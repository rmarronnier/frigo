class Notes::New < BrowserAction
  get "/fridges/:id/notes/new" do
    fridge = FridgeQuery.find(id)
    html NewPage, operation: SaveNote.new, associated_fridge: fridge
  end
end
