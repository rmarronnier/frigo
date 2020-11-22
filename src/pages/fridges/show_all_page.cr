class Fridges::ShowAllPage < MainLayout
  needs fridges : FridgeQuery

  def content
    h1 "These are your fridges"
    fridges.each do |fridge|
      h3 "Name : #{fridge.name}"
      h3 "First user : #{fridge.users!.first.email unless fridge.users!.size == 0}"
    end
  end
end
