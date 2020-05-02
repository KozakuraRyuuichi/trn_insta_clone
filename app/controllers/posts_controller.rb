class PostsController < ApplicationController
  # Sorceryでデフォルトで実装されている
  before_action :require_login, only: %i[new show edit]
  def index
    # postと関連付けされているuserテーブルからデータを取得する
    # 絞り込みを行うため、includesメソッドを選択する
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def new
  end

  def show
  end

  def edit
  end
end
