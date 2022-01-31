# AniSync

The purpose of this project is to provide a user-friendly interface to synchronize the information of your multiple anime lists from different services

## Services planned for the first scope

* MyAnimeList.net
* Kitsu.io

# Models associations

![image](https://drive.google.com/uc?export=view&id=1N-1bfoH8RDOw3sspC8WNPJ9b6aRO4B62)

# Models details

## User

| Attribute       | Type        |
| -----------     | ----------- |
| user_name       | string      |
| email           | string      |
| joined_at       | datetime    |

## Authentication Provider

| Attribute       | Type        |
| -----------     | ----------- |
| provider_id     | string      |
| user_id         | string      |
| user_name       | string      |
| access_token    | string      |
| refresh_token   | string      |

## List Entry

| Attribute       | Type        |
| -----------     | ----------- |
| user_id         | integer     |
| anime_id        | integer     |
| status          | string      |
| episodes_seen   | integer     |
| score           | integer     |
| started_at      | datetime    |
| finished_at     | datetime    |

## Anime

| Attribute       | Type        |
| -----------     | ----------- |
| mal_id          | integer     |
| kitsu_id        | integer     |
| name            | string      |
| other_names     | string      |
| synopsis        | string      |
| studios         | string      |
| aired_at_year   | integer     |
| emission_status | string      |
| image_url       | string      |
| streaming_urls  | string      |

## Streaming Platform

| Attribute       | Type        |
| -----------     | ----------- |
| name            | string      |
| image_url       | string      |
| site_url        | string      |


# TO DO later:

Specify the following:

* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
