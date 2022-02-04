require "graphql/client"
require "graphql/client/http"

module AnilistApiWrapper
  @@bearer_token = nil
  
  HTTP = GraphQL::Client::HTTP.new("https://graphql.anilist.co") do
    def headers(context)
      headers = { 
        "Content-Type": "application/json",
        "Accept": "application/json"
      }
      headers["Authorization"] = "Bearer #{ @@bearer_token }" if @@bearer_token != nil
      headers
    end
  end

  Schema = GraphQL::Client.load_schema(HTTP)

  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)

  def self.bearer_token=(token)
    @@bearer_token = token
  end

  def self.bearer_token
    @@bearer_token
  end
end