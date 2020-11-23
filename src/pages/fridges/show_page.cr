class Fridges::ShowPage < MainLayout
  needs fridge : Fridge

  def content
    h1 "This is your fridge"
    h3 "Name : #{fridge.name}"
    h3 "Users :"
    ul
    fridge.users!.each do |user|
      li user.email
    end
    h3 "Notes :"
    ul
    fridge.notes!.each do |note|
      li note.content
    end
    link "Create a new note", to: Notes::New.with(id: fridge.id), flow_id: "create-note-button"

    # h3 "Email:  #{@current_user.email}"
    # helpful_tips
  end

  # private def helpful_tips
  #   h3 "Next, you may want to:"
  #   ul do
  #     li { link_to_authentication_guides }
  #     li "Modify this page: src/pages/me/show_page.cr"
  #     li "Change where you go after sign in: src/actions/home/index.cr"
  #   end
  # end

  # private def link_to_authentication_guides
  #   a "Check out the authentication guides",
  #     href: "https://luckyframework.org/guides/authentication"
  # end
end
