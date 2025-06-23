# Local Food Discovery

Local Food Discovery は、旅行先の飲食店を共有しあう Ruby on Rails 製のアプリケーションです。ユーザーは店舗の情報を投稿し、他のユーザーと交流できます。

## 主な機能

- **投稿機能**: 店名・所在地・写真・価格帯・食事の時間帯・評価を登録できます。画像のアップロードには Active Storage を使用しています。
- **検索機能**: 日本地図上のエリアボタンやテキスト検索から店舗を検索できます。Google Places API を利用して営業時間も取得します。
     ![スクリーンショット 2025-06-22 110841](https://github.com/user-attachments/assets/0d42a2db-40b7-4d3e-a2cb-f299a15bc651)

- **いいね・おすすめ**: 投稿に対していいねや、おすすめ（同じ市区町村のユーザー向け）を付けられます。いいね数によるランキングも表示します。
  ![image (29)](https://github.com/user-attachments/assets/5285ef1c-37e9-47a2-8cb6-a7883172cd45)
- **ログイン機能**: ユーザー名とメールアドレス，および県名と市町村を選択式を登録します．県名の表示によって，地元民かどうかが分かります．
  <img src="https://github.com/user-attachments/assets/1e1b3277-bbe6-433a-a5e0-cf48d43b61ef" style="width: 90%;" />

   

- **フォロー・DM**: ユーザー登録後、フォロー機能やメッセージルームでのやり取りが可能です。
- **地図表示**: 投稿詳細ページでは Google Maps を表示し、緯度経度を登録することで店舗の位置を確認できます。
   ![スクリーンショット 2025-06-22 110921](https://github.com/user-attachments/assets/0ec25421-002c-4389-9227-1204d1a2793c)

## 動作環境

- Ruby 3.0.6
- Rails 6.1
- SQLite3
- Node.js / Yarn

## セットアップ

1. リポジトリをクローンします。
   ```bash
   git clone <repo_url>
   cd Local_Food_Discovery
   ```
2. 依存ライブラリをインストールします。
   ```bash
   bundle install
   yarn install
   ```
3. `.env` などに Google Maps 用の API キーを設定します。
   ```bash
   export GOOGLE_MAP_API_KEY=your_api_key
   ```
4. データベースを作成・初期化します（都道府県・市町村データが `db/seeds.rb` で登録されます）。
   ```bash
   rails db:setup
   ```
5. サーバーを起動します。
   ```bash
   rails server
   ```
   `http://localhost:3000` にアクセスして動作を確認してください。

## テスト

Rails 標準のテストスイートを利用しています。以下のコマンドで実行できます。
```bash
rails test
```

## ライセンス

このリポジトリにはライセンスファイルが含まれていません。

