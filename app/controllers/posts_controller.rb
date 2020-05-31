class PostsController < ApplicationController
  # Sorceryでrequire_loginがデフォルトで実装されている
  before_action :require_login, only: %i[new create edit update destroy]

  # postと関連付けされているuserテーブルからデータを取得する
  # 絞り込みを行うため、includesメソッドを選択する
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  # /posts/new
  def new
    @post = Post.new
  end

  # ログインユーザーが投稿できる
  # 投稿成功したらindexページに戻る
  # 投稿失敗したら投稿ページに戻る
  # 関連付けしているため慣習的にbuildを使う
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: '投稿しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  # /post/:id
  # _comments.html.slimの@commnetsで@post.commentを受ける
  # 投稿フォームで使用するcommentインスタンスを作成
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.new
  end

  # ログインユーザーのみが編集できる
  def edit
    @post = current_user.posts.find(params[:id])
  end

  # ログインユーザーのみが編集できる
  # 成功したらindexページに戻る
  # 失敗したら投稿ページに戻る
  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, success: '編集しました'
    else
      flash.now[:danger] = '編集に失敗しました'
      render :new
    end
  end

  # ログインユーザーのみが削除できる
  # 削除が中断された場合は例外を出すようにする
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, success: '削除しました'
  end

  private

  def post_params
    params.require(:post).permit(:content, images: [])
  end
end
