class Fridges::Show < BrowserAction
  get "/fridges/:id" do
    fridge = FridgeQuery.find(id)
    html ShowPage, fridge: fridge
  end
end
