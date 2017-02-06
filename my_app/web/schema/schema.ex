defmodule MyApp.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema
  alias MyApp.Models.{User, Widget}
  alias MyApp.Database

  node interface do
    resolve_type fn
      %User{}, _ ->  :user
      %Widget{}, _ -> :widget
      _, _ ->  nil
    end
  end

  # Define your own types here
  node object :user, description: "A person who uses our app" do
    field :name, :string
    connection field :widgets, node_type: :widget do
      resolve fn
        pagination_args, %{source: _user} ->
          connection = Absinthe.Relay.Connection.from_list(
            Database.get_widgets(), pagination_args
          )
          {:ok, connection}
        end
    end
  end

  node object :widget, description: "A shiny widget" do
   field :name, :string, description: "The name of the widget"
  end

  # Define your own connection types here
  connection node_type: :widget

  # This is the type that will be the root of our query,
  # and the entry point into our schema.
  query do
    field :viewer, :user, description:
      "Returns account details that match the id of the tokens passed" do
      resolve fn(_,_) -> {:ok, Database.get_viewer()} end
    end
    node field do
      resolve fn
        %{type: :user, id: id}, _ ->
          {:ok, Database.get_user(id)}
        %{type: :widget, id: id}, _ ->
          {:ok, Database.get_widget(id)}
      end
    end
  end

end
