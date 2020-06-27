# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)      not null
#  images     :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, PostImageUploader
  serialize :images, JSON

  validates :images, presence: true
  validates :content, presence: true, length: { maximum: 500 }

  # commentsとの関連付け。また、post削除時にcommentも削除する
  has_many :comments, dependent: :destroy
  # 先に中間テーブルとの関連付け
  # 中間テーブルをlikesテーブルとしてlike_usersでどのuserがlikeしたかを取得する
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
end
