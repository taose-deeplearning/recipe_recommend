# recipe-recommend

「recipe-recommend」は材料名から料理のレシピを紹介するAPIを提供します。
レシピは[RAKUTEN WEB SERVICE](http://webservice.rakuten.co.jp/)のAPIから取得します。

# 動作環境

- Ruby 2.3.1
- Ruby on Rails 5.0.1
- MySQL 5.6

# 開発環境動作手順

## レポジトリのクローン

```
$ git clone git@github.com:taose-deeplearning/recipe_recommend.git
```

## Gemライブラリのインストール

```
$ bundle install
```

## DB環境の準備

```
$ cp dot.env .env
```

以下のように`.env`にデータベースのusername、passwordを記入。(適宜)

```
DEVELOP_DB_USER=root
DEVELOP_DB_PASS=root
```

## RAKUTEN APP-ID, AFF-IDの取得

[RAKUTEN WEB SERVICE](http://webservice.rakuten.co.jp/)より取得

以下のように`.env`にAPP-ID(アプリID)とAFF-ID(アフェリエイトID)を記入。(適宜)

```
RAKUTEN_APPID=345843958493093423
RAKUTEN_AFID=9dfe9d9f.sdfi9iv.sd9dfje.3i9fejfj
```

## データベースの作成・準備

```
$ bundle exec rake db:create
$ bundle exec rake db:migrate
```

## データの取得

まずは、レシピのカテゴリを取得する。

```
$ rails runner bin/scraping_recipe_category.rb
```

次に、それぞれのカテゴリのランキング上位のレシピを取得する。

```
$ rails runner bin/scraping_recipe_from_category.rb
```

## Ruby on Railsの起動

```
$ bundle exec rails s
```

`http://localhost:3000`にアクセスして`index`の文字が返ってくれば成功。

## JSONの取得

`http://localhost:3000/search?query=玉ねぎ`のようにするとレシピの一覧をJSONで取得出来る。
