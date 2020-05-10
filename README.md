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


#アプリ名
**babylife**

#アプリコンセプト
何かと大変な子育て。ストレスや悩みを抱えているママさんがたくさんいるかと思います。<br>
私も1歳と半年になる一児の娘を育てていますが、非常に活発な時期で頭を悩ませることもしばしば。<br>
そんなママさんたちに悩みや子育てに役立つ便利アイテムなどの情報交換できる場があれば<br>
「私だけじゃなかったんだ」「こんなものあったんだ」などと、安心できたり自分の子育てに役立てられると思い<br>
このアプリを作成しました。

![サンプル](https://github.com/kana1203/babylife/blob/master/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202020-05-10%2022.20.04.png width="80px;")

#アプリで出来る事
<dl>
  <dt>ユーザー登録</dt>
  <dd>名前、email、passwordの設定が必要。</dd>
  <dt>投稿</dt>
  <dd>タイトル、本文、画像、ジャンル選択することにより投稿可能。</dd>
  <dt>いいね機能</dt>
  <dd>投稿をお気に入り登録できる。マイページより登録してものは確認可能。非同期通信化。</dd>
  <dt>フォロー、フォロワー機能</dt>
  <dd>フォローするとマイページより確認可能。フォローしてくれているユーザーも確認できる。</dd>
  <dt>コメント機能</dt>
  <dd>ログインしているとコメント可能。非同期通信化。</dd>
  <dt>検索機能</dt>
  <dd>タイトルを検索できるようになっている。</dd>
  <dt>ジャンル別投稿切り替え</dt>
  <dd>自分がみたいジャンルのみの表示に切り替えができる。</dd>
</dl>

#アプリURL
[babylife](https://quiet-mountain-30137.herokuapp.com/)

#工夫したポイント
ユーザーが欲しい情報を検索しやすいようにジャンル別に投稿させて検索の手間を省いた。<br>
フォロー機能の実装により、好きな人の投稿を簡単に探せる。<br>
いいね機能の実装により、再度みたい投稿をマイページから簡単に探せる。<br>

#使用技術(開発環境)
HTML・CSS・Ruby・Ruby on Rails・JavaScript・jQuery・SQL・Git・ GitHub・Haml・SCSS・heroku

#課題や今後実装したい機能
評価機能を実装し、商品ごとのランキングの実装。



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