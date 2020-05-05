source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# 追加したgem
# メモリ上にKey-Valueストア（KVS）を構築することができるソフトウェアの一つ。
gem 'redis-rails'
# slim利用テンプレートエンジンで、htmlをより簡潔でセキュア(HTMLエスケープするため)に書ける
# Jade風のインデントでHTMLテンプレートを作れるライブラリ
gem 'slim-rails'
# 既存のERB形式ファイルをslim形式に変換
gem 'html2slim'
# ユーザ認証機能を簡単に実装できるライブラリ、deviseより自由度高い
gem 'sorcery'
# 国際化に対応（For 5.0.x, 5.1.x and 5.2.x）
gem 'rails-i18n', '~> 5.1'
# Font Awesomeの利用
gem 'font-awesome-sass'
# carrierwaveを使ってファイルアップロードを実装する
gem 'carrierwave'
# 画像のリサイズ
gem 'mini_magick'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # rails consoleコマンドで起動するデフォルトのREPLであるirbの代わってpryを起動
  gem 'pry-rails'
  # ステップ実行できるライブラリ、irbではなくpryを起動
  gem 'pry-byebug'
  # 簡単に多種多様なダミーデータをデータベースに投入できるgem
  gem 'faker'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # ウェブビューからrails consoleにアクセスできるgem
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # テーブルのスキーマをModelのファイルにコメントを書いてくれるので、開発者がスキーマの確認をしやすくなる
  gem 'annotate'
  # Railsのデフォルトエラー画面をより使い勝手の良いものにするライブラリ
  gem 'better_errors'
  # better_errorsでコンソールを使えるようにする
  gem 'binding_of_caller'
  # rubocopの導入
  gem 'rubocop'
  gem 'rubocop-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
