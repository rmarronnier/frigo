class Invites::Summary < BaseComponent
  needs invite : Invite

  def render
    section do
      link "Join #{FridgeQuery.find(invite.fridge_id).name}", to: Fridges::Join.with(id: invite.fridge_id), flow_id: "join-fridge-button"
    end
  end
end
