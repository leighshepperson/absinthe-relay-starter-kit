defmodule MyApp.Router do
  use MyApp.Web, :router

  pipeline :graphql do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :graphql

    forward "/graphql", Absinthe.Plug, schema: MyApp.Schema

    if Mix.env == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL, schema: MyApp.Schema
    end
  end
end
