class Fridges::Show < BrowserAction
  get "/fridges/:id" do
    fridge = FridgeQuery.find(id)
    if fridge.users!.includes?(current_user)
      html ShowPage, fridge: fridge, current_user_id: current_user.id
    else
      redirect to: Home::Index
    end
  end
end
