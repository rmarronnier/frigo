class Notes::Delete < BrowserAction
  post "/delete/fridges/:fridge_id/notes/:note_id" do
    note = NoteQuery.find(note_id)
    note.delete unless note.user_id != current_user.id
    redirect to: Fridges::Show.with(id: fridge_id) # Home::Index
  end
end
