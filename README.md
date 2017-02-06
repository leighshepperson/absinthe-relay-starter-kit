# absinthe-relay-starter-kit

This project is port of the [relay-starter-kit](https://github.com/relayjs/relay-starter-kit) that implements the graphql server using [phoenix](http://www.phoenixframework.org/) and [absinthe](https://github.com/absinthe-graphql/absinthe).

# What changes were made?

This GitHub visual diff [shows the main changes](https://github.com/leighshepperson/absinthe-relay-starter-kit/commit/cf1e750058e9ae9eb024c9230df73fbea5bdcdc7).

Note, this project intentionally matches the general structure found in the [relay-starter-kit](https://github.com/relayjs/relay-starter-kit).

# Development

To start your Phoenix app:

  * Navigate to `my_app`
  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000/graphiql`](http://localhost:4000/graphiql) to introspect your schema.

To start your Relay app:

  * Navigate to `relay-starter-kit`
  * Install dependencies with `npm install`
  * Start a local server with `npm start`

Now you can visit [`localhost:3000`](http://localhost:3000/) to view your relay application.

Changes to `schema.ex` will require the relay server to be stopped and
the `update-schema` script to be ran.

```
npm run update-schema
npm start
```
