class BoxesReflex < ApplicationReflex
  def update_box_name(id, name)
    box = Box.find(id)
    box.update(name: name)

    if box == Box.last
      create_box
    else
      @halted = true
    end
  end

  def update_note_content(id, content)
    note = Note.find(id)
    note.update(content: content)

    if note == Note.last
      create_box
    else
      @halted = true
    end
  end

  def create_box
    Box.create(
      name: "",
      user: current_user,
      boxable: Note.create(content: "")
    )
  end
end