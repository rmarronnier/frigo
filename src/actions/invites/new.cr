class Invites::New < BrowserAction
  get "/fridges/:id/invites/new" do
    fridge = FridgeQuery.find(id)
    html NewPage, operation: SaveInvite.new, associated_fridge: fridge
    # html NewPage, operation: SaveInvite.new(fridge_id: id.to_i64), associated_fridge: fridge
  end
end
