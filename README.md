# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :posts
- has_many :comments
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :passive_relationships, source: :following


## postsテーブル

|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|text|text|null: false|
|image|text|null: false|
|user_id|references|null: false, foreign_key: true|
|genre_id|references|null: false, foreign_key: true|

### Association
- has_many :comments
- belongs_to :user
- belongs_to :genre


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post, optional: true


## genresテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :posts


## relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|following_id|integer|null: false|
|follower_id|integer|null: false|

### Association
- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"


## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|post_id|integer|null: false|

### Association
- belongs_to :user
- belongs_to :post