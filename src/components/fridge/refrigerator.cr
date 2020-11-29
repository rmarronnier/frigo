class Refrigerator < BaseComponent
  needs fridge : Fridge

  def render
    div class: "refrigerator" do
      ul class: "notes" do
        fridge.notes!.each do |note|
          li class: "note" do
            text "#{note.content}"
            link "Delete", to: Notes::Delete.with(fridge_id: fridge.id, note_id: note.id), flow_id: "delete-note-button"
          end
        end
        li do
          link "Create a new note", to: Notes::New.with(id: fridge.id), flow_id: "create-note-button", class: "create-note-button"
        end
      end
    end
  end
end
