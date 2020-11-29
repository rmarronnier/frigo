class Shared::LayoutHead < BaseComponent
  needs page_title : String
  # This is used by the 'csrf_meta_tags' method
  needs context : HTTP::Server::Context

  def render
    head do
      utf8_charset
      title "Frigo - #{@page_title}"
      css_link asset("css/app.css"), data_turbolinks_track: "reload"
      # css_link asset("css/tailwind.css"), data_turbolinks_track: "reload"
      # css_link "https://unpkg.com/mvp.css"
      js_link asset("js/app.js"), defer: "true", data_turbolinks_track: "reload"
      meta name: "turbolinks-cache-control", content: "no-cache"
      csrf_meta_tags
      responsive_meta_tag
    end
  end
end
