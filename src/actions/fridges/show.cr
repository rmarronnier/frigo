class Fridges::Show < BrowserAction
  get "/fridges/:id" do
    fridge = FridgeQuery.find(id)
    if fridge.users!.includes?(current_user)
      html ShowPage, fridge: fridge
    else
      redirect to: Home::Index
    end
  end
end
