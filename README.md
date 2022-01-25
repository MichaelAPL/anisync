# AniSync

The purpose of this project is to provide a user-friendly interface to synchronize the information of your multiple anime lists from different services

## Services planned for the first scope

* MyAnimeList.net
* Kitsu.io

# Models associations

![image](https://drive.google.com/uc?export=view&id=1R6VfYM-FM5TMcolnofxQ_p12lENI_5fr)

# Models details

## User

| Attribute       | Type        |
| -----------     | ----------- |
| user_name       | string      |
| email           | string      |
| linked_services | integer     |
| joined_at       | datetime    |

## Anime

| Attribute       | Type        |
| -----------     | ----------- |
| mal_id          | integer     |
| kitsu_id        | integer     |
| name            | string      |
| other_names     | string      |
| translated_names| string      |
| year            | integer     |
| image_link      | string      |
| streaming_links | string      |

## Streaming Service

| Attribute       | Type        |
| -----------     | ----------- |
| name            | string      |
| image_link      | string      |
| link_to_site    | string      |


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
