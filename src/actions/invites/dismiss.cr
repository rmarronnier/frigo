class Invites::Dismiss < BrowserAction
  post "/delete/invites/:id" do
    invite = InviteQuery.find(id)
    invite.delete unless current_user.email != invite.email
    redirect to: Fridges::Show.with(id: current_user.id)
  end
end
