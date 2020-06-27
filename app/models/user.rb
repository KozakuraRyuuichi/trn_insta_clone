# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  crypted_password :string(255)
#  email            :string(255)      not null
#  salt             :string(255)
#  username         :string(255)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_pasword] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true

  # postsとの関連付け。また、user削除時にpostも削除する
  has_many :posts, dependent: :destroy
  # commentsとの関連付け。また、user削除時にcommentも削除する
  has_many :comments, dependent: :destroy
  # 先に中間テーブルとの関連付けを行う
  # 中間テーブルをlikesテーブルとしてlike_postsでどのpostをlikeしたかを取得する
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post

  # ユーザーと投稿ユーザーが一致するか
  def own?(object)
    id == object.user_id
  end

    # paramsで与えられたpostのpost_id:カラムからpost.idを取得する
    # そのpost.idとcurrent_user.idを使ってlikesテーブルを埋めるイメージ
  def like(post)
    likes.create(post_id: post.id)
  end

  # destryoは配列に対して使えない。よってwhereではなくfind_by
  # current_user.idでのlikesからpostのpost.idを取得。
  # 合致する行を削除するイメージ
  def unlike(post)
    likes.find_by(post_id: post.id).destroy
  end

  # 答え見た
  # include?でself.postとpostが等しいかを判定
  def like?(post)
    like_posts.include?(post)
  end
end
