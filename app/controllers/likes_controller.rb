class LikesController < ApplicationController
  before_action :require_login, only: %i[create destroy]

  # paramsから:post_idを取得してインスタンス変数@postに代入する
  # ログインしているユーザーが@postの:post_idのpostにlikeする
  def create
    @post = Post.find(params[:post_id])
    current_user.like(@post)
  end

  # Like.find(params[:id])でログインユーザーがlikeしたlikeのidを取得
  # それに対してpostメソッドでpost_idを取得して、@postに代入
  # これによって、自分がlikeしたidが取得できて、unlikeできる
  def destroy
    @post = Like.find(params[:id]).post
    current_user.unlike(@post)
  end
end
