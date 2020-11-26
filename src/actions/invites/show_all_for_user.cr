class Invites::ShowAllForUser < BrowserAction
  get "/invites" do
    invites = current_user.invites
    html ShowAllForUserPage, invites: invites
  end
end
