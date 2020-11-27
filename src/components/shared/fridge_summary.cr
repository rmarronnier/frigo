class Fridges::Summary < BaseComponent
  needs fridge : Fridge

  def render
    section do
      link to: Fridges::Show.with(id: fridge.id), flow_id: "show-fridge-button" do
        figure class: "md:flex bg-gray-100 rounded-xl p-8 md:p-0" do
          img class: "w-32 h-32 md:w-48 md:h-auto md:rounded-none rounded-full mx-auto", src: "", alt: "", width: "", height: ""
          div class: "pt-6 md:p-8 text-center md:text-left space-y-4" do
            para class: "text-lg font-semibold" do
              text fridge.name
            end
            figcaption class: "font-medium text-cyan-600" do
              fridge.users!.each do |user|
                text user.email
              end
            end
          end
        end
      end
    end
  end
end
