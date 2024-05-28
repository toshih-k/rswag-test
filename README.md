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

## 開発環境のセットアップ

### 前提環境

* git
* docker-desktop

### 手順

リポジトリをクローンする
```
git clone https://github.com/toshih-k/rswag-test rswag-test
```

Docker Composeのビルドと立ち上げ
```
docker compose build
docker compose up
```

## 使い方

```
rake rswag:specs:swaggerize
```