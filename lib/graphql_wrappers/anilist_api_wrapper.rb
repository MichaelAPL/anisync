require "graphql/client"
require "graphql/client/http"

module AnilistApiWrapper 
  HTTP = GraphQL::Client::HTTP.new("https://graphql.anilist.co") do
    def headers(context)
      { "User-Agent": "My Client" }
    end
  end

  Schema = GraphQL::Client.load_schema(HTTP)

  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)
end