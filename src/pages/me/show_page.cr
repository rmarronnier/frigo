class Me::ShowPage < MainLayout
  def content
    section do
      h1 "This is your profile"
      h3 "Email:  #{@current_user.email}"
      fridges_view
      invites_view
    end
  end

  private def fridges_view
    @current_user.fridges!.each do |fridge|
      mount Fridges::Summary, fridge: fridge
    end
  end

  private def invites_view
    @current_user.invites.each do |invite|
      mount Invites::Summary, invite: invite
    end
  end

  private def helpful_tips
    h3 "Next, you may want to:"
    ul do
      li { link_to_authentication_guides }
      li "Modify this page: src/pages/me/show_page.cr"
      li "Change where you go after sign in: src/actions/home/index.cr"
    end
  end

  private def link_to_authentication_guides
    a "Check out the authentication guides",
      href: "https://luckyframework.org/guides/authentication"
  end
end
