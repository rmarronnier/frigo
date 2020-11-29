class Shared::LayoutNav < BaseComponent
  needs user : User

  def render
    nav do
      link to: Me::Show, flow_id: "me-button" do
        text "#{user.name.to_s} (#{user.email})"
      end
      text " - "
      link "Fridges(#{user.fridges!.size})", to: Fridges::ShowAll, flow_id: "fridges-button"
      text " - "
      link "Invites(#{user.invites.size})", to: Invites::ShowAllForUser, flow_id: "invites-button" if user.invites.size > 0
      text " - "
      link "Sign out", to: SignIns::Delete, flow_id: "sign-out-button"
    end
  end
end
