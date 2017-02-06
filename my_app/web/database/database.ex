defmodule MyApp.Database do
  alias MyApp.Models.{User, Widget}

  @viewer %User{id: "1", name: "Anonymous"}

  widgets = ["What's-it", "Who's-it", "How's-it"]
  |> Enum.with_index
  |> Enum.map(fn {name, i} -> %Widget{name: name, id: "#{i}"} end)

  @widgets widgets

  def get_user(id) do
    if id == @viewer.id do @viewer else nil end
  end

  def get_viewer(),
    do: @viewer

  def get_widget(id),
    do: @widgets |> Enum.find(& &1.id == id)

  def get_widgets(),
    do: @widgets

end
