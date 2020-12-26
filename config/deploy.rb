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

#config/credentials.yml.incの参照に使用
append :linked_files, "config/master.key"

# rubyのバージョンを指定
set :rbenv_ruby, '2.6.3'

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

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :confirm do
    on roles(:app) do
      puts "This stage is '#{fetch(:stage)}'. Deploying branch is '#{fetch(:branch)}'."
      puts 'Are you sure?'
      ask :answer, '[y/n]'
      if fetch(:answer) != 'y'
        puts 'deploy stopped'
        exit
      end
    end
  end

  desc "Initial Deploy"
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc "Restart Application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting, :confirm
end
