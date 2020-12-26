# このファイルには全ステージ共通の設定を書く

# config valid for current version and patch releases of Capistrano
# Capistranoのバージョンを固定
lock "~> 3.14.1"

# ----------------------------------------------------------
# 変数のセット → setしておくとfetchで参照できるようになる
# ----------------------------------------------------------

# アプリケーションの名前
set :application, "WEBCAMP_kadaiEX"

# デプロイ元となるGithubリポジトリの名前
set :repo_url, "git@github.com:sf-12/WEBCAMP_kadaiEX.git"

# リポジトリのブランチを指定
set :branch, 'master'

# sudoをコマンドにつけるか設定する
set :user_sudo, false

# ログを詳細に出力
set :log_level, :debug

append :linked_files, "config/master.key" #無いとconfig/credentials.yml.incがひらけずエラーになっるぽい

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"


# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# ----------------------------------------------------------
# タスクの記入　
# ----------------------------------------------------------

# task :list do
#   on roles(:web) do |host|
#     execute "ls"
#   end
# end