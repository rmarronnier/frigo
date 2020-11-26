class Invites::ShowAllForUserPage < MainLayout
  needs invites : InviteQuery

  def content
    h1 "These are your invites"
    ul
    invites.each do |invite|
      li
      link "Join #{FridgeQuery.find(invite.fridge_id).name}", to: Fridges::Join.with(id: invite.fridge_id), flow_id: "join-fridge-button"
      link "Dismiss invite", to: Invites::Dismiss.with(id: invite.id), flow_id: "dismiss-invite-button"
      # h3 "Name : #{fridge.name}"
      # h3 "First user : #{fridge.users!.first.email unless fridge.users!.size == 0}"
    end
  end
end
